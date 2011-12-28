class AddDebugToUser < ActiveRecord::Migration
  def up
     add_column :users, :debug, :boolean, :default => 1
   end

   def down
     remove_column :users, :debug
   end
end
