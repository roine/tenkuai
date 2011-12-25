class Role < ActiveRecord::Base
  #add sql relation tables
  has_and_belongs_to_many :users
end
