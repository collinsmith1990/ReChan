class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  validates :content, presence: true, length: { maximum: 1000 }
  attr_accessor :current_user
  before_save :assign_user_id

  private

  def assign_user_id
    self.user_id = current_user.id if current_user
  end
end
