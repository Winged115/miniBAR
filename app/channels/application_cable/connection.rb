module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
    end

    def session
      cookies.encrypted[Rails.application.config.session_options[:key]]
    end

    protected
      def find_verified_user
        patron = Patron.find_by(id: session["patron_id"])
        bar = Bar.find_by(id: session["bar_id"])
        if patron
          patron
        elsif bar
          bar
        else
          reject_unauthorized_connection
        end
      end
  end
end
