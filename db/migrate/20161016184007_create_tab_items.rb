class CreateTabItems < ActiveRecord::Migration
  def change
    create_table :tab_items do |t|
      t.integer :drink_id, null: false
      t.integer :tab_id, null: false

      t.timestamps null: false
    end
  end
end
