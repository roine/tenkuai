class AddSlugToCatgories < ActiveRecord::Migration
  def change
    add_column :categories, :cached_slug, :string
  end
end
