class Vote < ActiveRecord::Base
	belongs_to :yelp_user
	belongs_to :review

	attr_accessible :cool, :funny, :review_id, 
	:useful, :yelp_user_id
end
