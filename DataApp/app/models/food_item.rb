class FoodItem < ActiveRecord::Base
  attr_accessible :businesses_ids, :name

  serialize :businesses_ids


  def self.import_from_file(filename)
  	JSON.parse(open(filename).read).each do |food, list|
  		FoodItem.create(
  			:name => food,
  			:businesses_ids => list.uniq
  			)
  	end
  end
end
