class CreateOrganisations < ActiveRecord::Migration
  def change
    create_table :organisations do |t|
      t.string :name
      t.text :summary
      t.string :website
      t.string :location
      t.integer :shir_id
      t.integer :org_type_id
      t.integer :org_payment_id

      t.timestamps
    end
  end
end
