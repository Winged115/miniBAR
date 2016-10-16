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
      render_template new
    end
  end

  def edit
    @patron = Patron.find(params[:id])
  end


end
