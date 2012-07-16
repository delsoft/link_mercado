class CreateBrandAvailables < ActiveRecord::Migration
  def change
    create_table :brand_availables do |t|
      t.integer :business_unit_id
      t.string :description

      t.timestamps
    end
  end
end
