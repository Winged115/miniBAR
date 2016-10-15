class CreatePatrons < ActiveRecord::Migration
  def change
    create_table :patrons do |t|
      t.string :first_name
      t.string :last_name
      t.string :customer_id
      t.string :user_id

      t.timestamps null: false
    end
  end
end
