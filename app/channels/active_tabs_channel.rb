class ActiveTabsChannel < ApplicationCable::Channel
  def subscribed
    # if current_user.class == Bar
    	stream_for current_user
  	# end
  end

end
