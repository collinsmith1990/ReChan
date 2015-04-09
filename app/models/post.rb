class Post < ActiveRecord::Base
  has_many :comments, :dependent => :destroy
  belongs_to :user
  validates :title, presence: true, length: { maximum: 100 }
  validates :content, length: { maximum: 1000 }
  validates :link, allow_nil: true, allow_blank: false, length: { maximum: 500 }
  validates_format_of :link, :with => URI::regexp(%w(http https)), allow_nil: true

  def type
    if self.link
      "link"
    else
      "post"
    end
  end

  def linker
    unless self.link
      "post_path(post)"
    else
      self.link
    end
  end
end
