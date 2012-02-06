class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :role_ids, :debug, 
                  :introduction, :website, :country, :city, :photo_file_name, :photo_content_type, 
                  :photo_file_size, :photo, :cached_slug
  
  #add the friendly id as username
  extend FriendlyId
  friendly_id :username, :use => :slugged
  
  #sql relation between tables
  has_many :shirs
  has_and_belongs_to_many :roles
  has_many :orders
  has_many :sent_messages, :class_name => "Message", :foreign_key => "author_id"
  has_many :received_messages, :class_name => "MessageCopy", :foreign_key => "recipient_id"
  has_many :folders
  
  before_create :setup_role, :build_inbox
  
  def inbox
  folders.find_by_name("Inbox")
  end
  
  def build_inbox
    folders.build(:name =>"Inbox")
  end

  #allow to save the edit form without typing password
  def update_with_password(params={})
    params.delete(:current_password)
    self.update_without_password(params)
  end
  
  #conf for the profile pictures
  has_attached_file :photo,
      :styles => {
        :thumb=> "100x100!",
        :small  => "150x150!" }

  #setup default role
  def setup_role 
       if self.role_ids.empty?     
         self.role_ids = [3] 
       end
     end

    #featured
    
    scope :featured, :conditions => {:featured => true}

  #check the username field
  validates :username, :presence=>true,:uniqueness=>true, :format => {:with => /^[A-Za-z0-9_\.@]+$/}, :length => {:minimum => 3, :maximum => 20}
end
