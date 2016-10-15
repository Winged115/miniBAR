class AddNameToBars < ActiveRecord::Migration
  def change
    add_column :bars, :name, :string, null: false
  end
end
