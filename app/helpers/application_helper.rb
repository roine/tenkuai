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
end
