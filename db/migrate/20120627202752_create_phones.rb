class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.integer :type_contact_id
      t.string :number
      t.string :area_code
      t.string :extension

      t.timestamps
    end
  end
end
