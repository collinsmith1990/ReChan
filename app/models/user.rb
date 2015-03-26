class User < ActiveRecord::Base
  validates :user_name, presence: true, length: { maximum: 30 }, 
                        uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, length: { minimum: 6 }, allow_blank: true

end
