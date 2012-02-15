class Organisation < ActiveRecord::Base
  has_many :shirs
  belongs_to :org_type
end
