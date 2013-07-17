class Follow < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :user
  belongs_to :follower, :class_name => "User"
end
