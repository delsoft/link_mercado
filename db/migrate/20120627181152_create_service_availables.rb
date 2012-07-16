class CreateServiceAvailables < ActiveRecord::Migration
  def change
    create_table :service_availables do |t|
      t.integer :business_unit_id
      t.string :description

      t.timestamps
    end
  end
end
