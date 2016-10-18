class TabItemsController < ApplicationController

  def create
    @tab_item = TabItem.new(tab_item_params)
    @tab = @tab_item.tab
    respond_to do |format|
      if @tab_item.save
        format.html { redirect_to tab_path(@tab) }
        format.js { render :file => "/drinks/create.js.erb" }
      else
        @errors = ["There's been a problem"]
        format.html { render '/drinks/index' }
        format.js
      end
    end
  end

  def destroy
    tab_item = TabItem.find(params[:id])
    tab = tab_item.tab
    tab_item.destroy
    redirect_to tab_path(tab)
  end


  private

  def tab_item_params
    params.require(:tab_item).permit(:tab_id, :drink_id)
  end

end
