class Post < ActiveRecord::Base
  belongs_to :user
  attr_accessible :content
  has_one :activity
end
