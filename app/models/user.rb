class User < ActiveRecord::Base
  attr_accessible :email, :password, :posts, :token, :username
end
