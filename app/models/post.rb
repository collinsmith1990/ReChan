class Post < ActiveRecord::Base
  has_many :comments, :dependent => :destroy
  validates :title, presence: true, length: { maximum: 100 }
  validates :content, presence: true, length: { maximum: 1000 }
end
