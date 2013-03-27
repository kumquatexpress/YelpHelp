class Category < ActiveRecord::Base

	has_and_belongs_to_many :businesses, :join_table => :businesses_categories
	
	attr_accessible :name
end
