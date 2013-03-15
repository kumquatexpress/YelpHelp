class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses, {:primary_key => "business_id"} do |t|
      t.string :business_id
      t.string :full_address
      t.string :schools
      t.boolean :open
      t.string :categories
      t.string :photo_url
      t.string :city
      t.integer :review_count
      t.string :name
      t.string :neighborhoods
      t.string :url
      t.float :longitude
      t.string :state
      t.float :stars
      t.float :latitude

      t.timestamps
    end
    change_column :businesses, :business_id, :string
  end
end
