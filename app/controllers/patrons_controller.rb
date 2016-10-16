class PatronsController < ApplicationController

  def new
    @patron = Patron.new
  end

  def create
    @patron = Patron.new(patron_params)
    if @patron.save
      session[:patron_id] = @patron.id
      redirect_to
  end

end
