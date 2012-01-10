class CreateMessages < ActiveRecord::Migration
  def change
    drop_table :messages
    drop_table :message_copies
    create_table :messages do |t|
      t.integer :author_id
      t.string :subject
      t.text :body

      t.timestamps
    end
  end
end
