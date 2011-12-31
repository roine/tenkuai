class Shir < ActiveRecord::Base
  #sql relation between tables
  belongs_to :user
  belongs_to :category
  has_many :orders
  
  #tag to shirs
  acts_as_taggable

  #use friendly id as title
  has_friendly_id :title, :use_slug => true

  #check validity of fields
  validates :title, :presence=>true
  
  #conf for the profile pictures
  has_attached_file :photo,
      :styles => {
        :thumb=> "97x97!",
        :small  => "306x132!",
        :medium => "310x220!" }
end
