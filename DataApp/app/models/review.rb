class Review < ActiveRecord::Base
	self.primary_key = "review_id"

	has_one :vote
	belongs_to :yelp_user
	belongs_to :business

	attr_accessible :business_id, :date, :review_id, :stars, 
	:text, :yelp_user_id

	def self.stars(num)
		where(:stars => num)
	end
	def self.find_food_item(food, operation="text")
		unless operation
			operation = "text"
		end
		reviews = []
		foods = "'%" + food + "%'"
		Review.where("text LIKE #{foods}").each do |r|
			reviews << {review: {id: r.review_id, business: r.business_id, info: r.send(operation)}}
		end
		reviews
	end

end
