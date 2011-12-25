class Shir < ActiveRecord::Base
  #sql relation between tables
  belongs_to :user
  has_many :categories

  #use friendly id as title
  has_friendly_id :title, :use_slug => true

  #check validity of fields
  validates :title, :presence=>true
end
