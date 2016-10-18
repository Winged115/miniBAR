class PatronsController < ApplicationController

  def new
    @patron = Patron.new
  end

  def create
    @patron = Patron.new(patron_params)
    account_params = {}
    if @patron.save
      session[:bar_id] = nil
      session[:patron_id] = @patron.id
      p session[:patron_id]
      redirect_to patrons_payment_method_path
    else
      @errors = @patron.errors.full_messages
      render :new
    end
  end

  def edit
    @patron = Patron.find(params[:id])
  end

  # def update
  #   bt_customer_create_response = Braintree::Customer.create(account_params)
  #   if bt_customer_create_response.succes?
  #     Patron.create(first_name: , last_name: , customer_id: bt_customer_create_response.customer.id, user_id: )
  #   else

  #   end
  # end

  def payment_method
    @client_token = Braintree::ClientToken.generate()
  end

  def create_bt_customer
    result = Braintree::Customer.create(
      :first_name => current_user.first_name,
      :last_name => current_user.last_name,
      :payment_method_nonce => params['payment-method-nonce']
      )
    if result.success?
      current_user.update_attributes(customer_id: result.customer.id)
      redirect_to bars_path
    else
      p result.errors
    end
  end

  private

  def patron_params
    params.require(:patron).permit(:first_name, :last_name, :email, :password)
  end

end
