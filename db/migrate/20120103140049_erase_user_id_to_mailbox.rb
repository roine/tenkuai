class EraseUserIdToMailbox < ActiveRecord::Migration
  def up
    remove_column :mailboxes, :user_id
  end

  def down
  end
end
