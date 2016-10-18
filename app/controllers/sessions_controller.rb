class SessionsController < ApplicationController

  def new
  end

  def create
    empty_session_tokens
    @patron = Patron.find_by(email: params[:email])
    @bar = Bar.find_by(email: params[:email])
    if @patron
      authenticate_patron(@patron)
    elsif @bar
      authenticate_bar(@bar)
    else
      @errors = ["Wrong email or password"]
      render :new
    end
  end

  def destroy
    if @patron.find(session[:patron_id])
      session.destroy
      redirect_to new_session_path
    elsif @bar.find(session[:bar_id])
      @bar.update_attributes(discoverable: false)
      session.destroy
      redirect_to new_session_path
    end
  end

  private

  def empty_session_tokens
    session.destroy
  end

  def authenticate_patron(patron)
    if patron.authenticate(params[:password])
      session[:patron_id] = patron.id
      redirect_to bars_path
    else
      @errors = ["Wrong email or password"]
      render :new
    end
  end

  def authenticate_bar(bar)
    if bar.authenticate(params[:password])
      session[:bar_id] = bar.id
      redirect_to bar_tabs_path(bar)
    else
      @errors = ["Wrong email or password"]
      render :new
    end
  end

end
