module HelperMethods
	def average_stars(arr)
		sum = arr.map{|x| x.stars}.inject{|x,y| x+y}
		sum.to_f/arr.count
	end
	def refresh_reviews_text(filename)
		JSON.parse(open(filename).read).reverse.drop(Business.count).each do |obj|
			if obj['type'] == "review"
				if Review.find_by_review_id(obj['review_id']).text.length > 256
					Review.find_by_review_id(obj['review_id']).update_attributes(:text => obj['text'])
				end	
			end
		end
	end
	def import_from_file(filename)
		require 'json'
		types = %w{user review business}
		JSON.parse(open(filename).read).reverse_each do |obj|
			if obj['votes']
				vote = Vote.create(
				:funny => obj['votes']['funny'],
				:useful => obj['votes']['useful'],
				:cool => obj['votes']['cool']
				)
			end
			case obj['type']
			when types[0]
				YelpUser.find_or_create_by_user_id(
				:review_count => obj['review_count'],
				:name => obj['name'],
				:url => obj['url'],
				:average_stars => obj['average_stars'],
				:user_id => obj['user_id'],
				).vote = vote
			when types[1]
				Review.find_or_create_by_review_id(
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
			end
		end
	end
end