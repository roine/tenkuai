module ApplicationHelper
  def title(page_title)
  if page_title.nil?
    content_for(:title) {"Gig for 20 Kuai"}
  else
    content_for(:title) {page_title}
  end
  end
  def resource_name
     :user
   end

   def resource
     @resource ||= User.new
   end

   def devise_mapping
     @devise_mapping ||= Devise.mappings[:user]
   end
  
end
