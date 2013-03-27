class Neighborhood < ActiveRecord::Base

	has_and_belongs_to_many :businesses, :join_table => :businesses_neighborhoods

	attr_accessible :name
end
