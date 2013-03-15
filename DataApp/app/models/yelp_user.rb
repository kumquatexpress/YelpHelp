class YelpUser < ActiveRecord::Base
	self.primary_key = "user_id"

	has_one :vote
	has_many :reviews
	attr_accessible :average_stars, :name, :review_count,
	:type, :url, :user_id


	def self.import_from_file(filename)
		require 'json'
		types = %w{user review business}
		JSON.parse(open(filename).read).drop(YelpUser.all.count).each do |obj|
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
					Business.create(
					:business_id => obj['business_id'],
					:full_address => obj['full_address'],
					:schools => obj['schools'],
					:open => obj['open'],
					:categories => obj['categories'],
					:photo_url => obj['photo_url'],
					:city => obj['city'],
					:review_count => obj['review_count'],
					:name => obj['name'],
					:neighborhoods => obj['neighborhoods'],
					:url => obj['url'],
					:longitude => obj['longitude'],
					:state => obj['state'],
					:stars => obj['stars'],
					:latitude => obj['latitude'],
					)
				else
					next
				end
			end
		end
	end

end
