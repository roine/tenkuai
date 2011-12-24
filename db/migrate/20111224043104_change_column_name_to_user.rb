class ChangeColumnNameToUser < ActiveRecord::Migration
  def up
    rename_column :users, :user_type_id, :role_id
  end

  def down
  end
end
