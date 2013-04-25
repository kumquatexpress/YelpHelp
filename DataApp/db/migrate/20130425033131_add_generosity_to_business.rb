class AddGenerosityToBusiness < ActiveRecord::Migration
  def change
  	add_column :businesses, :generosity, :decimal, :precision => 2
  end
end
