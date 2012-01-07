class Category < ActiveRecord::Base
  #link with Shir
  has_many :shirs
  
  #use title for path
  extend FriendlyId
  friendly_id :title, :use => :slugged
end
