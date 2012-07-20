class AddDefaultValuesToTypeContact < ActiveRecord::Migration
  def up
    #remove_column :type_contacts, :is_system
    #add_column :type_contacts, :is_system?, :boolean, :default => false
    change_column :type_contacts, :is_system, :boolean, :default => false
  end
  
  def down
    #remove_column :type_contacts, :is_system?
    #add_column :type_contacts, :is_system, :boolean
    change_column :type_contacts, :is_system, :boolean
  end
end
