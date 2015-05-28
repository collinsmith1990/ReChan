class User < ActiveRecord::Base
  has_many :comments, :dependent => :destroy
  has_many :posts
  has_many :user_item_bumps
  has_many :bumped_posts, through: :user_item_bumps, source: :post

  validates :user_name, presence: true, length: { maximum: 35 }, 
                        uniqueness: { case_sensitive: false }
  validates :display_name, length: { maximum: 35 }, 
                        uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_blank: true
  before_save :set_display_name, :downcase_user_name

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  private

    def set_display_name
      self.display_name = user_name
    end

    def downcase_user_name
      self.user_name = user_name.downcase
    end
end
