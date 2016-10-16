class TabsController < ApplicationController

  def edit
    @tab = Tab.find(params[:id])
  end

end
