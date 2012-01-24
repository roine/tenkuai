class AddSenderToMessageCopy < ActiveRecord::Migration
  def change
    add_column :message_copies, :sender, :integer, :default => 1
  end
end
