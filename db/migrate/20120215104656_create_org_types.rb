class CreateOrgTypes < ActiveRecord::Migration
  def change
    create_table :org_types do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
