class CreateAddressesBusinessUnits < ActiveRecord::Migration
  def up
    create_table :addresses_business_units do |t|
      t.references :business_unit
      t.references :address 
    end
  end

  def down
    drop_table :addresses_business_units
  end
end
