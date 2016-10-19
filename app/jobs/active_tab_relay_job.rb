class ActiveTabRelayJob < ApplicationJob
  def perform(tab)
    ActionCable.server.broadcast "active_tabs",
      tab_id: tab.id
    end
end
