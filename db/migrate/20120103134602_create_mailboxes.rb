class CreateMailboxes < ActiveRecord::Migration
  def change
    create_table :mailboxes do |t|
      t.integer :user_id
      t.string :subject
      t.text :content

      t.timestamps
    end
  end
end
