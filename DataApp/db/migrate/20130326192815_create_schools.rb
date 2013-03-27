class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools, {:primary_key => "name"} do |t|
      t.string :name

      t.timestamps
    end
    change_column :schools, :name, :string
  end
end
