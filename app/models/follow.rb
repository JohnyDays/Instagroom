class Follow < ActiveRecord::Base
  attr_accessible :following_id, :user_id
 validates :following_id,:user_id, :presence => true
  belongs_to :user
  belongs_to :following, :class_name => "User"
end
