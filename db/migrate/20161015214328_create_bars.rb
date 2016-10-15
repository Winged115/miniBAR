class CreateBars < ActiveRecord::Migration
  def change
    create_table :bars do |t|
      t.string :name
      t.string :address
      t.string :merchant_account_id
      t.boolean :discoverable
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
