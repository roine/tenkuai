class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :username
      t.string :password
      t.string :photo
      t.integer :user_type_id
      t.integer :order_id

      t.timestamps
    end
  end
end
