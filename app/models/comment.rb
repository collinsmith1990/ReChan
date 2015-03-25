class Comment < ActiveRecord::Base
  belongs_to :post
  validates :commenter, length: { maximum: 100 }
  validates :content, presence: true, length: { maximum: 1000 }

end
