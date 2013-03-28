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
	def self.import_from_file(filename)
		require 'json'
		types = %w{user review business}
		JSON.parse(open(filename).read).reverse_each do |obj|
			id_exists = YelpUser.where(:user_id => obj['user_id']).any? or
			Review.where(:review_id => obj['review_id']).any? or
			Business.where(:business_id => obj['business_id']).any?

			unless id_exists
				if obj['votes']
					vote = Vote.create(
					:funny => obj['votes']['funny'],
					:useful => obj['votes']['useful'],
					:cool => obj['votes']['cool']
					)
				end
				case obj['type']
				when types[0]
					YelpUser.create(
					:review_count => obj['review_count'],
					:name => obj['name'],
					:url => obj['url'],
					:average_stars => obj['average_stars'],
					:user_id => obj['user_id'],
					).vote = vote
				when types[1]
					Review.create(
					:review_id => obj['review_id'],
					:stars => obj['stars'],
					:date => obj['date'],
					:text => obj['text'],
					:business_id => obj['business_id'],
					:yelp_user_id => obj['user_id']
					).vote = vote
				when types[2]
					business = Business.find_or_create_by_business_id(
					:business_id => obj['business_id'],
					:full_address => obj['full_address'],
					:open => obj['open'],
					:photo_url => obj['photo_url'],
					:city => obj['city'],
					:review_count => obj['review_count'],
					:name => obj['name'],
					:url => obj['url'],
					:longitude => obj['longitude'],
					:state => obj['state'],
					:stars => obj['stars'],
					:latitude => obj['latitude'],
					)
					obj['categories'].each do |c|
						tmp = Category.find_or_create_by_name(c)
						business.categories << tmp
					end
					obj['neighborhoods'].each do |n|
						tmp = Neighborhood.find_or_create_by_name(n)
						business.neighborhoods << tmp
					end
					obj['schools'].each do |s|
						tmp = School.find_or_create_by_name(s)
						business.schools << tmp
					end
				else
					next
				end
			end
		end
	end

end
