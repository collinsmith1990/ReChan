class Post < ActiveRecord::Base
  has_many :comments, :dependent => :destroy
  has_many :user_item_bumps
  has_many :bumped_users, through: :user_item_bumps, source: :user
  belongs_to :user
  validates :title, presence: true, length: { maximum: 100 }
  validates :content, length: { maximum: 1000 }
  validates :link, allow_nil: true, allow_blank: false, length: { maximum: 500 }
  validates_format_of :link, :with => URI::regexp(%w(http https)), allow_nil: true
  attr_accessor :current_user

  def type
    if self.link
      "link"
    else
      "post"
    end
  end

  def bumps
    self.user_item_bumps.count
  end

  def points
    self.bumps + self.comments.count
  end

  def time
    (Time.now - self.created_at) / 3600
  end

  def score
   -1 * ((self.points / self.time + 2) ** 1.8)
  end

  def self.sort_by_score
    Post.all.sort_by(&:score)
  end
end
