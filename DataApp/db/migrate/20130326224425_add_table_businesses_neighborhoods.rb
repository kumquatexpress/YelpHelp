class AddTableBusinessesNeighborhoods < ActiveRecord::Migration
	def change
		create_table :businesses_neighborhoods, {:primary_key => false} do |t|
			t.string :business_id 
			t.string :neighboorhood_id
		end

		create_table :businesses_schools, {:primary_key => false} do |t|
			t.string :business_id
			t.string :school_id
		end

		create_table :businesses_categories, {:primary_key => false} do |t|
			t.string :business_id
			t.string :category_id
		end
	end
end
