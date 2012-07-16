class CreateBusinessGroups < ActiveRecord::Migration
  def change
    create_table :business_groups do |t|
      t.string :name
      t.text :description
      t.string :logo
      t.string :web
      t.integer :owner

      t.timestamps
    end
  end
end
