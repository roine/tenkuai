class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :shir_id
      t.integer :user_id
      t.integer :order_status_id
      t.integer :buyer_feedback_id

      t.timestamps
    end
  end
end
