class ActiveTabRelayJob < ApplicationJob
  def perform(tab)
    ActionCable.server.broadcast("active_tabs_#{tab.id}",
    	tab_id: '#{tab.id}')
    end
end