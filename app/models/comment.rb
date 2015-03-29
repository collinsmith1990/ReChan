class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  validates :content, presence: true, length: { maximum: 1000 }

  def commenter
    self.user.user_name
  end
end
