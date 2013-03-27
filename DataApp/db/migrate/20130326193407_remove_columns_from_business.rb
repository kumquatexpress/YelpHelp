class RemoveColumnsFromBusiness < ActiveRecord::Migration
	def change
		remove_column :businesses, :categories
		remove_column :businesses, :neighborhoods
		remove_column :businesses, :schools
	end
end
