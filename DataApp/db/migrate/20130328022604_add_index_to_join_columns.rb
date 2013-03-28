class AddIndexToJoinColumns < ActiveRecord::Migration
	def change
		add_index(:businesses_neighborhoods, :business_id)
		add_index(:businesses_neighborhoods, :neighborhood_id)
		add_index(:businesses_schools, :business_id)
		add_index(:businesses_schools, :school_id)
		add_index(:businesses_categories, :business_id)
		add_index(:businesses_categories, :category_id)
	end
end