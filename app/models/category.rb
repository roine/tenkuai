class Category < ActiveRecord::Base
  #link with Shir
  has_many :shirs
  
  #use title for path
  has_friendly_id :title, :use_slug => true
end
