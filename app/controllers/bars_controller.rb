class BarsController < ApplicationController

  def index
    @tab = Tab.new
    @patron = Patron.find(current_user.id)
    if params[:search]
      @active_bars = Bar.bar_search(params[:search])
      @active_bars.where(discoverable: true).limit(10)
    else
      @active_bars = Bar.where(discoverable: true).limit(10)
    end
    if request.xhr?
      render(json: @active_bars)
    end
  end

  def new
    @bar = Bar.new
  end

  def create
    @bar = Bar.new(bar_params)
    if @bar.save
      session[:patron_id] = nil
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
    p params
    if params[:bar][:close_all]
      @bar.close_all_tabs
      # flash[:success] = "All tabs have been closed"
      respond_to do |format|
        format.html { redirect_to settings_path(@bar) }
        format.js
      end
    elsif params[:bar][:update_discoverable]
      # p params
      toggle_discoverable(@bar)
      respond_to do |format|
        format.html { redirect_to settings_path(@bar) }
        format.js { render :discoverable }
      end
    else
    end
  end

  def settings
    @bar = Bar.find(params[:id])
    respond_to do |format|
      format.html
      format.json
    end
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
            :master_merchant_account_id => 'minibar1234567890'
          }
          result = Braintree::MerchantAccount.create(
            merchant_account_params
            )
          if result.success?
            p result
            current_user.update_attributes(merchant_account_id: result.merchant_account.id)
            redirect_to bar_tabs_path(session[:bar_id])
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
    if bar.discoverable == true
      bar.update_attributes(discoverable: false)
    elsif bar.discoverable == false
      bar.update_attributes(discoverable: true)
    end
  end


end
