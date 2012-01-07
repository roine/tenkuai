class Shir < ActiveRecord::Base
  #sql relation between tables
  belongs_to :user
  belongs_to :category
  has_many :orders
  
  #tag to shirs
  acts_as_taggable

  #use friendly id as title
  extend FriendlyId
  friendly_id :title, :use => :slugged

  #check validity of fields
  validates :title, :presence=>true, :length => {:minimum =>20, :maximum => 80}
  
  #conf for the profile pictures
  has_attached_file :photo,
      :styles => {
        :thumb=> "97x97!",
        :small  => "306x132!",
        :medium => "310x220!" }
end
