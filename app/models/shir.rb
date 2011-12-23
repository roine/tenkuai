class Shir < ActiveRecord::Base
  belongs_to :user
  has_many :categories
  has_friendly_id :title, :use_slug => true
  
  validates :title, :presence=>true
end
