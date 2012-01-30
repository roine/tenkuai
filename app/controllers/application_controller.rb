class ApplicationController < ActionController::Base
  protect_from_forgery
  # rescue_from CanCan::AccessDenied do |exception|
  #     flash[:error] = exception.message
  #     redirect_to root_url
  #   end
  #   rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
  #   rescue_from AbstractController::DoubleRenderError, :with => :record_not_found
  #   
  #    private
  # 
  #    def record_not_found
  #      render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
  #    end
  #    
  def get_categories
     @categories = Category.all
   end
  def own_message?
    return MessageCopy.find(params[:id]).recipient_id == current_user.id 
  end
end
