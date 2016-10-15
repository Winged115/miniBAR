class AddUniqueTokenAddressIsActiveToBars < ActiveRecord::Migration
  def change
    add_column :bars, :authentication_token, :string
    add_index :bars, :authentication_token, unique: true
    add_column :bars, :discoverable, :boolean
    add_column :bars, :address, :string, null: false
    add_column :bars, :city, :string, null: false
    add_column :bars, :state, :string, null: false
    add_column :bars, :zip, :integer, null: false

  end
end
