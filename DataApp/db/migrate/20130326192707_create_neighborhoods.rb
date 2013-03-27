class CreateNeighborhoods < ActiveRecord::Migration
  def change
    create_table :neighborhoods, {:primary_key => "name"} do |t|
      t.string :name

      t.timestamps
    end

    change_column :neighborhoods, :name, :string
  end
end
