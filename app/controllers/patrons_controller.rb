class PatronsController < ApplicationController

  def new
    @patron = Patron.new
  end

  def create
    @patron = Patron.new(patron_params)
    account_params = {}
    if @patron.save
      session[:patron_id] = @patron.id
      redirect_to edit_patron_path(@patron)
    else
      @errors = @patron.errors.full_messages
      render :new
    end
  end

  def edit
    @patron = Patron.find(params[:id])
  end

  def update
    bt_customer_create_response = Braintree::Customer.create(account_params)
    if bt_customer_create_response.succes?
      Patron.create(first_name: , last_name: , customer_id: bt_customer_create_response.customer.id, user_id: )
    else

    end
  end

  private

  def patron_params
    params.require(:patron).permit(:first_name, :last_name, :email, :password)
  end

end
