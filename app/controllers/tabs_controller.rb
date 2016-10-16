class TabsController < ApplicationController

  def new
    @tab = Tab.new
  end

  def create
    @patron = current_user
    @tab = Tab.new(patron_id: current_user.id, bar_id: params[:bar_id])
    if  @tab.save
      redirect_to patron_tab_path
    else
      @errors = @tab.errors.full_messages
      redirect_to bars_path
    end
  end

end
