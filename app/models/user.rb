class User < ActiveRecord::Base
  attr_accessible :email, :password, :posts, :token, :username
  has_many :posts

end
