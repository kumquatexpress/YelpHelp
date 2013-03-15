class Review < ActiveRecord::Base
	self.primary_key = "review_id"

	has_one :vote
	belongs_to :yelp_user
	belongs_to :business

	attr_accessible :business_id, :date, :review_id, :stars, 
	:text, :type, :yelp_user_id
end
