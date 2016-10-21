class DrinksController < ApplicationController

  def index
    @tab_item = TabItem.new
    @tab = Tab.find(params[:tab_id])
    @drinks = Drink.all
  end

end
