class CreateOrgPayments < ActiveRecord::Migration
  def change
    create_table :org_payments do |t|
      t.string :bank_name
      t.string :bank_acc_name
      t.string :bank_acc_no
      t.string :bank_acc_type
      t.integer :contact_person_id

      t.timestamps
    end
  end
end
