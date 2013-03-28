class AddTableBusinessesNeighborhoods < ActiveRecord::Migration
	def up
		create_table :businesses_neighborhoods, {:id => false} do |t|
			t.string :business_id 
			t.string :neighborhood_id
		end
		execute	"""ALTER TABLE businesses_neighborhoods
			ADD FOREIGN KEY (business_id)
			REFERENCES businesses(business_id)"""
		execute """ALTER TABLE businesses_neighborhoods
			ADD	FOREIGN KEY (neighborhood_id)
			REFERENCES neighborhoods(name)"""

		create_table :businesses_schools, {:id => false} do |t|
			t.string :business_id
			t.string :school_id
		end
		execute	"""ALTER TABLE businesses_schools
			ADD FOREIGN KEY (business_id)
			REFERENCES businesses(business_id)"""
		execute	"""ALTER TABLE businesses_schools
			ADD	FOREIGN KEY (school_id)
			REFERENCES schools(name)"""

		create_table :businesses_categories, {:id => false} do |t|
			t.string :business_id
			t.string :category_id
		end
		execute	"""ALTER TABLE businesses_categories
			ADD FOREIGN KEY (business_id)
			REFERENCES businesses(business_id)"""
		execute """ALTER TABLE businesses_categories
			ADD	FOREIGN KEY (category_id)
			REFERENCES categories(name)"""
	end

	def down 
		drop_table :businesses_schools
		drop_table :businesses_categories
		drop_table :businesses_neighborhoods
	end
end
