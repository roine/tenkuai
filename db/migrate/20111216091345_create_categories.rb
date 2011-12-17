class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :title
      t.text :desc
      t.integer :shir_id

      t.timestamps
    end
  end
end
