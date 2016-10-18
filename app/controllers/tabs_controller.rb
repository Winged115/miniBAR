
class TabsController < ApplicationController


  def show
    @tab = Tab.find(params[:id])
  end

  def new
    @tab = Tab.new
  end

  def edit
    @tab = Tab.find(params[:id])
  end

  def update
    @tab = Tab.find(params[:id])
    if @tab && session[:patron_id]
      @tab.closed = true
      @tab.total_amount = @tab.total_amount + params[:tip].to_f
      @tab.save
      bar = Bar.find(@tab.bar_id)
      p bar
      patron = Patron.find(@tab.patron_id)
      p patron
      bt_customer = Braintree::Customer.find(patron.customer_id)
      payment_method_token = bt_customer.credit_cards[0].token
      transaction_result = Braintree::Transaction.sale(
          :merchant_account_id => bar.merchant_account_id.to_s,
          :amount => @tab.total_amount.to_s,
          :payment_method_token => payment_method_token.to_s,
          :service_fee_amount => '0.00'
        )
      p transaction_result
      if transaction_result.success?
        p 'success'
      end
      redirect_to bars_path
    elsif @tab && session[:bar_id]
      @tab.closed = true
      @tab.total_amount = (@tab.total_owed * 1.25)
      @tab.save
      bar = Bar.find(@tab.bar_id)
      patron = Patron.find(@tab.patron_id)
      bt_customer = Braintree::Customer.find(patron.customer_id)
      payment_method_token = bt_customer.credit_cards[0].token
      p bar
      p bar.merchant_account_id
      transaction_result = Braintree::Transaction.sale(
          :merchant_account_id => bar.merchant_account_id.to_s,
          :amount => @tab.total_amount.to_s,
          :payment_method_token => payment_method_token.to_s,
          :service_fee_amount => '0.00'
        )
      p transaction_result
      if transaction_result.success?
        p 'success'
      end
      redirect_to bar_tabs_path(@tab.bar)
    else
      @errors = ["Something went wrong"]
      render :edit
    end
  end

  def create
    @tab = Tab.new(tab_params)
    if  @tab.save
      redirect_to tab_path(@tab)
    else
      @errors = ["There's been a problem opening your tab"]
      redirect_to bars_path
    end
  end

  def index
    @bar = Bar.find(current_user.id)
    all_open_tabs = @bar.tabs.where(closed: false)
    @tabs = all_open_tabs.sort_by {|tab| tab.patron.last_name}
  end

  private

  def tab_params
    params.require(:tab).permit(:total_amount, :patron_id, :bar_id, :closed)
  end

  # def generate_transaction(tab)
  #   bar = Bar.find(tab.bar_id)
  #   patron = Patron.find(tab.patron_id)
  #   bt_customer = Braintree::Customer.find(patron.customer_id)
  #   payment_method_token = bt_customer.credit_cards[0].token
  #   transaction_result = Braintree::Transaction.sale(
  #       :merchant_account_id => bar.merchant_account_id.to_s,
  #       :amount => tab.total_amount.to_s,
  #       :payment_method_token => payment_method_token.to_s,
  #       :service_fee_amount => '0.00'
  #     )
  #   p transaction_result
  #   if transaction_result.success?
  #     p 'success'
  #   end
  # end

end
