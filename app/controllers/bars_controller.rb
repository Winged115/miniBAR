class BarsController < ApplicationController


  def index
    @tab = Tab.new
    @patron = Patron.find(session[:patron_id])
    if params[:search]
      @active_bars = Bar.bar_search(params[:search])
    else
      @active_bars = Bar.all
    end
  end

  def new
    @bar = Bar.new
  end

  def create
    @bar = Bar.new(bar_params)
    if @bar.save
      session[:bar_id] = @bar.id
      redirect_to edit_bar_path(@bar)
    else
      @errors = @bar.errors.full_messages
      render :new
    end
  end

  def edit
    @bar = Bar.find(params[:id])
  end

  def update
    account_params = {}
    bt_merchant_create_response = Braintree::MerchantAccount.create(account_params)
    if bt_merchant_create_response.success?
      Bar.create(name: , address: , merchant_account_id: bt_merchant_create_response.id, user_id: )
    else

    end
  end

  private

  def bar_params
    params.require(:bar).permit(:name, :email, :password, :address, :city, :state, :zipcode)
  end

end
