class AddCustomerIdToPatrons < ActiveRecord::Migration
  def change
    add_column :patrons, :customer_id, :string
  end
end
