class User < ActiveRecord::Base
  has_many :shirs
  
  validates :username, :presence=>true, :length=>{:minimum=>3, :maximum=>25}
  validates :password, :presence=>true, :length=>{:minimum=>5}
  validates :email, :presence=>true,:format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/, :on => :create, :message=> "pinvalid format" }
end
