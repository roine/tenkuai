class UpdateTheUserTable < ActiveRecord::Migration
  def up
    remove_column :users, :password
    remove_column :users, :role_id
    add_column :users, :country, :string
    add_column :users, :city, :string
    add_column :users, :website, :string
    add_column :users, :introduction, :text
  end

  def down
    add_column :users, :password, :string
    add_column :users, :role_id, :integer
    remove_column :users, :country
    remove_column :users, :city
    remove_column :users, :website
    remove_column :users, :introduction
  end
end
