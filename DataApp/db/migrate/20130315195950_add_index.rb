class AddIndex < ActiveRecord::Migration
	def change
		add_index(:reviews, :yelp_user_id)
		add_index(:reviews, :business_id)
		add_index(:votes, :yelp_user_id)
		add_index(:votes, :review_id)
	end
end
