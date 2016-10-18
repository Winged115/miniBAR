class ActiveTabRelayJob < ApplicationJob
  def perform(tab)
    ActionCable.server.broadcast "active_tabs",
      tab: tab
    end
end
