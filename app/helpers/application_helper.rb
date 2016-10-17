module ApplicationHelper

  def logged_in?
    if session[:patron_id]
      return true
    end
  end

  def current_user
    @_patron ||= Patron.find(session[:patron_id]) if logged_in?
  end

end
