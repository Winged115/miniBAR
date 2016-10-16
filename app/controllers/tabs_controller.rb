class TabsController < ApplicationController

  def edit
    @tab = Tab.find(params[:tab_id])
  end

end
