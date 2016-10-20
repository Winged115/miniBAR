class ActiveTabsChannel < ApplicationCable::Channel
  def subscribed
    # if current_user.class == Bar
    	stream_from "bars:#{current_user.id}:active_tabs"
  	# end
  end

end
