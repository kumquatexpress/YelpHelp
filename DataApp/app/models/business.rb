class Business < ActiveRecord::Base
	self.primary_key = "business_id"

	has_and_belongs_to_many :categories
	has_and_belongs_to_many :schools
	has_and_belongs_to_many :neighborhoods

	has_many :reviews

	attr_accessible :business_id, :city, :full_address,
	:latitude, :longitude, :name, :open, :photo_url,
	:review_count, :stars, :state, :url

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
	def self.between_points(lat, long, lat2, long2)
		where("latitude > ? and latitude < ? and longitude > ?
		and longitude < ?", lat, lat2, long, long2)
	end
	def self.open
		where(:open => true)
	end
	def self.find_lat_long(str)
		require 'geocoder'
		c = Geocoder.search(str)[0]
		{"lat"=>c.lat, "long"=>c.long}
	end

end
