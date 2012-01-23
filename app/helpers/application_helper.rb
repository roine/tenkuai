module ApplicationHelper
  def title(page_title)
    if !page_title.nil?
      content_for(:title) {page_title}
    else
      content_for(:title) {"Gig for 20 Kuai"}
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

  def city(city, country)
    unless city.nil?
      if country.empty?
        "#{city}"
      else
        "#{city},"
      end
    end
  end

  def country(country)
    unless country.nil?
      country
    end
  end

  def clean_split(string, number)
    last_space = string[0,number].rindex(/ /)
    return string[0, last_space]<<'...'
  end

  def own_by?(user)
    return user_signed_in? && current_user.id == user.id
  end
  
  def not_own_by?(user)
    return user_signed_in? && current_user.id != user.id
  end
  
  def message_received
      box =  Folder.find_by_user_id(current_user.id).id
      return messages = MessageCopy.where(:status => 1, :folder_id => box).count
  end
  
  def new_message?
      box =  Folder.find_by_user_id(current_user.id).id
      messages = MessageCopy.where(:status => 1, :folder_id => box).count
      return messages > 0 ? true : false
  end
  
end
