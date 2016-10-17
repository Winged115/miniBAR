class BarsController < ApplicationController


  def index
    @tab = Tab.new
    @patron = Patron.find(current_user.id)
    if params[:search]
      @active_bars = Bar.bar_search(params[:search])
    else
      @active_bars = Bar.all
    end
  end

  def new
    @bar = Bar.new
  end

  def create
    @bar = Bar.new(bar_params)
    if @bar.save
      session[:bar_id] = @bar.id
      redirect_to edit_bar_path(@bar)
    else
      @errors = @bar.errors.full_messages
      render :new
    end
  end

  def edit
    @bar = Bar.find(params[:id])
  end

  def update
    @bar = Bar.find(params[:id])
    if params[:bar][:close_all]
      @bar.close_all_tabs
      redirect_to settings_path(@bar)
      flash[:success] = "All tabs have been closed"
    elsif params[:bar][:discoverable]
      toggle_discoverable(@bar)
    else
    end
  end

  def settings
    @bar = Bar.find(params[:id])
  end

  private

  def bar_params
    params.require(:bar).permit(:name, :email, :password, :address, :city, :state, :zipcode)
  end

  def toggle_discoverable(bar)
    bar.update_attributes(discoverable: params[:bar][:discoverable])
    redirect_to settings_path(@bar)
  end



end
