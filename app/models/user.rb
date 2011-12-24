class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :role_id
  has_friendly_id :username, :use_slug => true

  has_many :shirs
  has_and_belongs_to_many :roles
  
  def update_with_password(params={})

    params.delete(:current_password)

    self.update_without_password(params)

  end
  def role?(role)
      return !!self.roles.find_by_name(role.to_s.camelize)
  end
  
  validates :username, :presence=>true,:uniqueness=>true
 end
