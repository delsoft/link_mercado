class AddContactableToContact < ActiveRecord::Migration
  def up
    add_column :emails, :contact_id, :integer
    add_column :phones, :contact_id, :integer
    
  end    
  
  def down 
    remove_column :emails, :contact_id
    
    remove_column :phones, :contact_id
  end
end
