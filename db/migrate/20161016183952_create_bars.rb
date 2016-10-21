class CreateBars < ActiveRecord::Migration
  def change
    create_table :bars do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :address, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.integer :zipcode, null: false
      t.float :latitude
      t.float :longitude
      t.boolean :discoverable, default: false
      t.string :password_digest, null: false

      t.timestamps null: false
    end
  end
end
