class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.integer :user_id
      t.integer :shir_id
      t.boolean :payment_status
      t.integer :order_status
      t.integer :buyer_feedback_id

      t.timestamps
    end
  end
end
