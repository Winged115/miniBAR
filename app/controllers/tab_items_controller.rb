class TabItemsController < ApplicationController

  def create
    @tab_item = TabItem.new(tab_item_params)
    if @tab_item.save
      @tab = @tab_item.tab
      redirect_to tab_path(@tab)
    else
      @errors = ["There's been a problem"]
      render '/drinks/index'
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
