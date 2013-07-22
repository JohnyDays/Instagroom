class User < ActiveRecord::Base
  attr_accessible :email, :password, :posts, :token, :username
  has_many :posts
  has_many :follows
  has_many :followings, :through => :follows
  validates :email,:password,:username, :presence => true
 before_create :generate_token, :downcase_name
  def generate_token
    self.token = loop do
      random_token = SecureRandom.urlsafe_base64(n=nil, padding=false)
      break random_token unless User.where(token: random_token).exists?
    end
  end
  def downcase_name
    self.username.downcase!
  end
    def regenerate_token()
      self.token = loop do
      random_token = SecureRandom.urlsafe_base64(n=nil, padding=false)
      break random_token unless User.where(token: random_token).exists?
    end
  end
end
