class CreateAddressesBusinessUnits < ActiveRecord::Migration
  def up
    add_column :contacts, :contactable_id, :integer
    add_column :contacts, :contactable_type, :string
    
    # create_table :addresses_business_units do |t|
      # t.references :business_unit
      # t.references :address 
    # end
  end

  def down
    remove_column :contacts, :contactable_id
    remove_column :contacts, :contactable_type
#    drop_table :addresses_business_units
  end
end
