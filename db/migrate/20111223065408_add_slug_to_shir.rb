class AddSlugToShir < ActiveRecord::Migration
  def change
    add_column :shirs, :cached_slug, :string
  end
end
