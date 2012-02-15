class CreateContactPeople < ActiveRecord::Migration
  def change
    create_table :contact_people do |t|
      t.string :designation
      t.string :salutation
      t.string :first_name
      t.string :last_name
      t.string :identification
      t.string :tel
      t.string :email

      t.timestamps
    end
  end
end
