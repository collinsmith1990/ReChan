class User < ActiveRecord::Base
  validates :user_name, presence: true, length: { maximum: 30 }, 
                        uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, length: { minimum: 6 }, allow_blank: true
  before_save :down_case_user_name

  private
    
    def down_case_user_name
      self.user_name = user_name.downcase
    end
end
