class AddIndexToYelpUsers < ActiveRecord::Migration
	def change	
		add_index(:yelp_users, :user_id)
	end
end
