class BarsController < ApplicationController
  def create
    account_params = {}
    bt_merchant_create_response = Braintree::MerchantAccount.create(account_params)
    if bt_merchant_create_response.success?
      Bar.create(name: , address: , merchant_account_id: bt_merchant_create_response.id, user_id: )
    else

    end
  end

  def update
  end

end
