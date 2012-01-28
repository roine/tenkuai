class SentController < ApplicationController
  def index
    @messages = current_user.sent_messages.paginate :per_page => 10, :page => params[:page], :order => "created_at DESC"
  end

  def show
    @message = current_user.sent_messages.find(params[:id])
  end

  def new
    if params[:id]
      redirect_to root_path unless own_message?

      @previous_message = Message.find(MessageCopy.find(params[:id]).message_id)
    end
    redirect_to root_path if current_user.username == params[:user_id]
    to_message = params[:id] ? MessageCopy.find(params[:id]).message_id : {}
    @title = params[:id] ? Message.find(to_message).subject : {}
    @message = current_user.sent_messages.build
    @message_to = User.find(params[:user_id]).username
  end

  def create
    params[:message][:from] = current_user.id

    @message = current_user.sent_messages.build(params[:message])
    if @message.save
      flash[:notice] = "Message sent"
      redirect_to :action => 'index'
    else
      render :action => "new"
    end
  end

end
