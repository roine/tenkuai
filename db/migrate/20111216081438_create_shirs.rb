class CreateShirs < ActiveRecord::Migration
  def change
    create_table :shirs do |t|
      t.integer :user_id
      t.string :title
      t.integer :category_id
      t.text :description
      t.text :instruction
      t.integer :tag_id
      t.integer :days_to_complete
      t.string :image
      t.boolean :shipping_required
      t.integer :shipping_id
      t.integer :date_timestamp

      t.timestamps
    end
  end
end
