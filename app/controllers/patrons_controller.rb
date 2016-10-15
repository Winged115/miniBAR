class PatronsController < ApplicationController
  def create
    account_params = {}
    bt_customer_create_response = Braintree::Customer.create(account_params)
    if bt_customer_create_response.succes?
      Patron.create(first_name: , last_name: , customer_id: bt_customer_create_response.customer.id, user_id: )
    else

    end
  end
end
