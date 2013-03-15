class CreateYelpUsers < ActiveRecord::Migration
  def change
    create_table :yelp_users, {:primary_key => "user_id"} do |t|
      t.string :user_id
      t.string :name
      t.string :url
      t.float :average_stars
      t.integer :review_count

      t.timestamps
    end
    change_column :yelp_users, :user_id, :string
  end
end
