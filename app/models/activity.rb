class Activity < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  attr_accessible :post, :user
end
