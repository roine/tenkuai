class MessagesController < ApplicationController
  def show
    @message = current_user.received_messages.find(params[:id])
    @message.update_attributes(:status => 2)
  end

end
