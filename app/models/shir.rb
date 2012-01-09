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
  validates :title, :presence=>true, :length => {:minimum =>10, :maximum => 80}
  validates :category, :presence => true
  validates :description, :presence => true, :length => {:minimum => 40, :maximum => 255}
  validates :instruction, :presence => true, :length => {:minimum => 40, :maximum => 255}
  validates :tag_list, :presence => true
  validates :photo_file_name, :presence => true
  
  #conf for the profile pictures
  has_attached_file :photo,
      :styles => {
        :thumb=> "97x97!",
        :small  => "306x132!",
        :medium => "310x220!" }
end
