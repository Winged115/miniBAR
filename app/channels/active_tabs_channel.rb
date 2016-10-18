class ActiveTabsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "tab_#{params[:tab_id]}"
  end

end
