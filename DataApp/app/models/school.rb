class School < ActiveRecord::Base
	has_and_belongs_to_many :businesses, :join_table => :businesses_schools
	
	attr_accessible :name
end
