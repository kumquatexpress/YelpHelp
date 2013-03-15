class Business < ActiveRecord::Base
	self.primary_key = "business_id"

	serialize :categories
	serialize :neighborhoods
	serialize :schools

	has_many :reviews
	
	attr_accessible :business_id, :categories, :city,
	:full_address, :latitude, :longitude,
	:name, :neighborhoods, :open, :photo_url, :review_count,
	:schools, :stars, :state, :type, :url
end
