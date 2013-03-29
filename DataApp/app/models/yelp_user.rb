class YelpUser < ActiveRecord::Base
	self.primary_key = "user_id"

	scope :published, where("review_count > ?", 0)
	has_one :vote
	has_many :reviews
	attr_accessible :average_stars, :name, :review_count,
	:url, :user_id

	def self.reviews_over(num)
		where("review_count > ?", num)
	end
	def self.stars_over(num)
		where("average_stars > ?", num)
	end
	def self.stars(num)
		where(:average_stars => num)
	end
	def self.stars_under(num)
		where("average_stars < ?", num)
	end
	
end
