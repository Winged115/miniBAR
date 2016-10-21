class CreateDrinks < ActiveRecord::Migration
  def change
    create_table :drinks do |t|
      t.string :drink_name, null: false
      t.float :price, null: false

      t.timestamps null: false
    end
  end
end
