class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
      t.integer :company_id
      t.integer :profile_id

      t.timestamps
    end
  end
end
