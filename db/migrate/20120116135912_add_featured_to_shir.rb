class AddFeaturedToShir < ActiveRecord::Migration
  def change
    add_column :shirs, :featured, :boolean
    add_column :users, :featured, :boolean
  end
end
