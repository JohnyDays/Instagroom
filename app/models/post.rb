class Post < ActiveRecord::Base
  belongs_to :user
  attr_accessible :content, :id, :user_id,:source_id, :from_id, :created_at
end
