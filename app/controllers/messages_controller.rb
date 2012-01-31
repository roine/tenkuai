class MessagesController < ApplicationController

  def show
    redirect_to root_path and return unless own_message?
    @message = current_user.received_messages.find(params[:id])
    # @message.update_attributes(:status => 2)
    @photo = @message.author.photo_file_name ? @message.author.photo.url(:small) : 'test/santa.jpg'
    user = current_user.id
    corresponding = @message.author.id
    query = MessageCopy.where("sender = #{user}  AND recipient_id =  #{corresponding} OR sender = #{corresponding}  AND recipient_id =  #{user}")
    count = query.count
    @common_messages = query
    query.each do |q|
      q.update_attributes(:status => 2)
    end
  end

end
