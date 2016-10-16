class BarsController < ApplicationController

  def index
    @tab = Tab.new
    @patron = Patron.new
    if params[:search]
      @active_bars = Bar.bar_search(params[:search])
    else
      @active_bars = Bar.all
    end
  end



end
