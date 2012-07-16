class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.integer :state_id
      t.integer :city_id
      t.integer :district_id
      t.string :street_name
      t.string :string
      t.integer :house_number
      t.string :zip_code
      t.string :additional_address

      t.timestamps
    end
  end
end
