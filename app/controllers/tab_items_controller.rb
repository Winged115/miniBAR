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

  end


  private

  def tab_item_params
    params.require(:tab_item).permit(:tab_id, :drink_id)
  end

end
