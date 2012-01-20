class Users::RegistrationsController < Devise::RegistrationsController
  protected

  def after_update_path_for(resource)
    username_path(resource)
  end

  def after_sign_up_path_for(resource)
    username_path(resource)
  end
  
   def after_sign_in_path_for(resource)
     username_path(resource)
   end
   
   
 
def edit
  super
end
def new
  super
end
end