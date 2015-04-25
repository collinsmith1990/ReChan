class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  validates :content, presence: true, length: { maximum: 1000 }
  attr_accessor :current_user

end
