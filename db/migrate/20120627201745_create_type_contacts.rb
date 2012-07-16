class CreateTypeContacts < ActiveRecord::Migration
  def change
    create_table :type_contacts do |t|
      t.string :description
      t.boolean :is_system
      t.timestamps
    end
  end
end
