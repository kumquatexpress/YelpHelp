class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :cool
      t.integer :funny
      t.integer :useful
      t.integer :yelp_user_id
      t.integer :review_id

      t.timestamps
    end
  end
end
