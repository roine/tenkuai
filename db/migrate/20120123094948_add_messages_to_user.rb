class AddMessagesToUser < ActiveRecord::Migration
  def change
    add_column :message_copies, :status, :integer, :default => 1
  end
end
