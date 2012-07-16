class CreateStreets < ActiveRecord::Migration
  def change
    create_table :streets do |t|
      t.integer :state_id
      t.integer :city_id
      t.integer :district_id
      t.string :name
      t.integer :number
      t.string :additional_data
      t.string :zip_code

      t.timestamps
    end
  end
end
