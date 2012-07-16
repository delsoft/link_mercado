class CreateBusinessUnits < ActiveRecord::Migration
  def change
    create_table :business_units do |t|
      t.integer :business_group_id
      t.string :name
      t.string :corporate_name
      t.text :description
      t.string :cpf
      t.string :cnpj
      t.integer :owner

      t.timestamps
    end
  end
end
