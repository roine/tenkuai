class SentController < ApplicationController
  def index
    @messages = current_user.sent_messages.paginate :per_page => 10, :page => params[:page], :order => "created_at DESC"
  end

  def show
    @message = current_user.sent_messages.find(params[:id])
  end

  def new
    @message = current_user.sent_messages.build
    @message.to = User.find(params[:user_id]).username
  end
  
  def create
    @message = current_user.sent_messages.build(params[:message])
    # @message.to = User.find(params[:user_id]).id
    if @message.save
      flash[:notice] = "Message sent"
      redirect_to :action => 'index'
    else
      render :action => "new"
    end
  end

end
