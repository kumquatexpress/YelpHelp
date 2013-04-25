class Business < ActiveRecord::Base
	self.primary_key = "business_id"

	has_and_belongs_to_many :categories
	has_and_belongs_to_many :schools
	has_and_belongs_to_many :neighborhoods

	has_many :reviews

	attr_accessible :business_id, :city, :full_address,
	:latitude, :longitude, :name, :open, :photo_url,
	:review_count, :stars, :state, :url, :generosity

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
		puts str
		c = Geocoder.coordinates(str)
		{"lat"=>c[0], "long"=>c[1]}
	end
	def self.find_food_item(food)
	end

	def user_generosity
		review_sum = 0
		# for each user who reviewed the establishment
		self.reviews.each do |review|
			reviewer = review.yelp_user

			# retrieve all of their reviews

			user_review_sum = 0
			user_reviews = reviewer.reviews
			# for each of user's reviews
			user_reviews.each do |user_review|
				# compare the user's score with the average score
				avg_rating = user_review.business.stars
				user_rating = user_review.stars
				r_diff = user_rating - avg_rating
				user_review_sum += r_diff

				review_sum += user_review_sum/user_reviews.count
			end
		end
		review_sum/reviews.count
	end
end
