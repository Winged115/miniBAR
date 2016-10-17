class BarsController < ApplicationController


  def index
    @tab = Tab.new
    @patron = Patron.find(current_user.id)
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
      redirect_to bars_merchant_account_path
    else
      @errors = @bar.errors.full_messages
      render :new
    end
  end

  def edit
    @bar = Bar.find(params[:id])
  end

  def merchant_account
  end

  def update
    @bar = Bar.find(params[:id])
    if params[:bar][:close_all]
      @bar.close_all_tabs
      redirect_to settings_path(@bar)
      flash[:success] = "All tabs have been closed"
    elsif params[:bar][:discoverable]
      toggle_discoverable(@bar)
    else
    end
  end

  def settings
    @bar = Bar.find(params[:id])
  end

  def create_bt_merchant
    session[:patron_id]=nil
    merchant_account_params = {
      :individual => {
        :first_name => params[:first_name],
        :last_name => params[:last_name],
        :email => params[:email],
        :phone => params[:phone],
        :date_of_birth => params[:date_of_birth],
        :ssn => params[:ssn],
        :address => {
          :street_address => params[:individual][:street_address],
          :locality => params[:individual][:locality],
          :region => params[:individual][:region],
          :postal_code => params[:individual][:postal_code]
        }
        },
        :business => {
          :legal_name => params[:legal_name],
          :dba_name => params[:dba_name],
          :tax_id => params[:tax_id],
          :address => {
            :street_address => params[:business][:street_address],
            :locality => params[:business][:locality],
            :region => params[:business][:region],
            :postal_code => params[:business][:postal_code]
          }
          },
          :funding => {
            :descriptor => params[:descriptor],
            :destination => Braintree::MerchantAccount::FundingDestination::Bank,
            :email => params[:funding][:email],
            :mobile_phone => params[:funding][:mobile_phone],
            :account_number => params[:account_number],
            :routing_number => params[:routing_number]
            },
            :tos_accepted => true,
            :master_merchant_account_id => ENV['BT_MERCHANT_ID']
          }
          result = Braintree::MerchantAccount.create(
            merchant_account_params
            )
          if result.success?
            p result
            current_user.update_attributes(merchant_account_id: result.merchant_account.id)
            redirect_to root_path
          else
            p result.errors
            redirect_to root_path
          end
        end

  # def update
  #   account_params = {}
  #   bt_merchant_create_response = Braintree::MerchantAccount.create(account_params)
  #   if bt_merchant_create_response.success?
  #     Bar.create(name: , address: , merchant_account_id: bt_merchant_create_response.id, user_id: )
  #   else

  #   end
  # end

  private

  def bar_params
    params.require(:bar).permit(:name, :email, :password, :address, :city, :state, :zipcode)
  end


  def toggle_discoverable(bar)
    bar.update_attributes(discoverable: params[:bar][:discoverable])
    redirect_to settings_path(@bar)
  end


end
