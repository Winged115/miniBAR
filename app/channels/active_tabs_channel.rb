class ActiveTabsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "active_tabs_#{params[:tab_id]}"
  end

end
