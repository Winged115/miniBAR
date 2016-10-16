class SessionsController < ApplicationController

  def new
  end

  def create
    if @patron.find_by(params[:email])
      if @patron.authenticate(params[:password])
        session[:user_id] = @patron.id
        redirect_to
    elsif @bar.fin_by(params[:email])
    else
    end
  end

end
