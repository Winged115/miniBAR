class ActiveTabRelayJob < ApplicationJob
  def perform(bar)
    ActionCable.server.broadcast 'bars:#{bar.id}:active_tabs',
    	tabs: '#{bar.tabs}'
    end
end