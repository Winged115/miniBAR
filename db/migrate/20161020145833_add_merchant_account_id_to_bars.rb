class AddMerchantAccountIdToBars < ActiveRecord::Migration
  def change
    add_column :bars, :merchant_account_id, :string
  end
end
