class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.integer :type_contact_id
      t.string :address

      t.timestamps
    end
  end
end
