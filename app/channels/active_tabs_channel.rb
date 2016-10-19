class ActiveTabsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "active_tabs"
  end

end
