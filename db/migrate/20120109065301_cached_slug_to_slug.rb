class CachedSlugToSlug < ActiveRecord::Migration
  def up
    rename_column :categories, :cached_slug, :slug
    rename_column :users, :cached_slug, :slug
    rename_column :shirs, :cached_slug, :slug
  end

  def down
  end
end
