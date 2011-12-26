class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :role_ids
  #add the friendly id as username
  has_friendly_id :username, :use_slug => true
  #sql relation between tables
  has_many :shirs
  has_and_belongs_to_many :roles
  
  # before_save :setup_role

  #allow to save the edit form without typing password
  def update_with_password(params={})
    params.delete(:current_password)
    self.update_without_password(params)
  end

  #setup default role
  # def setup_role 
  #     if self.role_ids.empty?     
  #       self.role_ids = [3] 
  #     end
  #   end


  #check the username field
  validates :username, :presence=>true,:uniqueness=>true
end
