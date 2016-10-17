class CreateTabs < ActiveRecord::Migration
  def change
    create_table :tabs do |t|
      t.float :total_amount, default: 0.00
      t.integer :patron_id, null: false
      t.integer :bar_id, null: false
      t.boolean :closed, default: false


      t.timestamps null: false
    end
  end
end
