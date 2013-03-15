class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews, {:primary_key => "review_id"} do |t|
      t.string :yelp_user_id
      t.string :review_id
      t.integer :stars
      t.string :date
      t.string :text
      t.string :business_id

      t.timestamps
    end
    change_column :reviews, :review_id, :string
  end
end
