class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories, {:primary_key => "name"} do |t|
      t.string :name

      t.timestamps
    end
    change_column :categories, :name, :string
  end
end
