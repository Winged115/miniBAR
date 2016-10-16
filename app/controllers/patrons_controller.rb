class PatronsController < ApplicationController

  def new
    @patron = Patron.new
  end

  def create
    @patron = Patron.new(patron_params)
    if @patron.save
      session[:patron_id] = @patron.id
      redirect_to edit_patron_path(@patron)
    else
      @errors = @patron.errors.full_messages
      render :new
    end
  end

  def edit
    @patron = Patron.find(params[:id])
  end

  private

  def patron_params
    params.require(:patron).permit(:first_name, :last_name, :email, :password)
  end

end
