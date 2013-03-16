class Business < ActiveRecord::Base
	self.primary_key = "business_id"

	serialize :categories
	serialize :neighborhoods
	serialize :schools

	has_many :reviews
	
	attr_accessible :business_id, :categories, :city,
	:full_address, :latitude, :longitude,
	:name, :neighborhoods, :open, :photo_url, :review_count,
	:schools, :stars, :state, :url

	def self.has_photo
		where("photo_url is not null")
	end
	def self.review_count_over(num)
		where("review_count > ?", num)
	end
	def self.review_count_under(num)
		where("review_count < ?", num)
	end
	def self.near_location(lat, long, radius=0.0001)
		where("latitude > ? and latitude < ? and longitude > ?
			and longitude < ?", lat-radius, lat+radius, 
			long-radius, long+radius)
	end
	def self.open
		where(:open => true)
	end
	

end
