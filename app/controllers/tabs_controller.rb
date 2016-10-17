class TabsController < ApplicationController


  def show
    @tab = Tab.find(params[:id])
  end

  def new
    @tab = Tab.new
  end

  def update
    @tab = Tab.find(params[:id])
    if @tab && session[:patron_id]
      @tab.closed = true
      @tab.total_amount = params[:total]
      @tab.save
      redirect_to bars_path
    elsif @tab && session[:bar_id]
      @tab.closed = true
      @tab.total_amount = (@tab.total_owed * 1.25)
      @tab.save
      redirect_to bar_tabs_path(@tab.bar)
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

  def index
    @bar = Bar.find(current_user.id)
    @tabs = @bar.tabs.where(closed: false)
  end

  private

  def tab_params
    params.require(:tab).permit(:total_amount, :patron_id, :bar_id, :closed)
  end

end
