class Shir < ActiveRecord::Base
  belongs_to :user
  has_many :categories
  
  validates :title, :presence=>true
end
