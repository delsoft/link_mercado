class CreateBusinessUnitsPaymentMethods < ActiveRecord::Migration
  def up
    create_table :business_units_payment_methods do |t|
      t.references :business_unit
      t.references :payment_method      
    end
  end

  def down
    drop_table :business_units_payment_methods
  end
end
