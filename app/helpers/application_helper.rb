module ApplicationHelper

  def logged_in?
    if session[:patron_id] || session[:bar_id]
      return true
    end
  end

  def current_user
    if session[:patron_id]
      @_patron ||= Patron.find(session[:patron_id]) if logged_in?
    elsif session[:bar_id]
      @_bar ||= Bar.find(session[:bar_id]) if logged_in?
    end
  end

end
