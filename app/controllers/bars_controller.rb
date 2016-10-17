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

  def create_bt_merchant
    merchant_account_params = {
      :individual => {
        :first_name => "Jane",
        :last_name => "Doe",
        :email => "jane@14ladders.com",
        :phone => "5553334444",
        :date_of_birth => "1981-11-19",
        :ssn => "456-45-4567",
        :address => {
          :street_address => "111 Main St",
          :locality => "Chicago",
          :region => "IL",
          :postal_code => "60622"
        }
        },
        :business => {
          :legal_name => "Jane's Ladders",
          :dba_name => "Jane's Ladders",
          :tax_id => "98-7654321",
          :address => {
            :street_address => "111 Main St",
            :locality => "Chicago",
            :region => "IL",
            :postal_code => "60622"
          }
          },
          :funding => {
            :descriptor => "Blue Ladders",
            :destination => Braintree::MerchantAccount::FundingDestination::Bank,
            :email => "funding@blueladders.com",
            :mobile_phone => "5555555555",
            :account_number => "1123581321",
            :routing_number => "071101307"
            },
            :tos_accepted => true,
            :master_merchant_account_id => "14ladders_marketplace",
            :id => "blue_ladders_store"
          }
          result = Braintree::MerchantAccount.create(
            merchant_account_params
            )
          if result.success?
            current_user.update_attributes(customer_id: result.customer.id)
            redirect_to root_path
          else
            p result.errors
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

end
