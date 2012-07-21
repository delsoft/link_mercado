class AddBusinessUnitIdToContact < ActiveRecord::Migration
  
  def up
    add_column :contacts, :business_unit_id, :integer
  end
  
  def down
    remove_column :contacts, :business_unit_id
  end
  
end
