class TabsController < ApplicationController


  def show
    @tab = Tab.find(params[:id])
  end

  def new
    @tab = Tab.new
  end

  def update
    @tab = Tab.find(params[:id])
    if @tab
      @tab.closed = true
      @tab.total = params[:total]
      redirect_to bars_path
    else
      @errors = ["Something went wrong"]
      render :edit
    end
  end

  def create
    @tab = Tab.new(tab_params)
    if  @tab.save
      redirect_to patron_tab_path(session[:patron_id],@tab)
    else
      @errors = ["There's been a problem opening your tab"]
      redirect_to bars_path
    end
  end

  private

  def tab_params
    params.require(:tab).permit(:total_amount, :patron_id, :bar_id, :closed)
  end

end
