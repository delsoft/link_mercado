class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.string :name, :length => 8

      t.timestamps
    end
  end
end
