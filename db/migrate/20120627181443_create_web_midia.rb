class CreateWebMidia < ActiveRecord::Migration
  def change
    create_table :web_midia do |t|
      t.integer :type_web_midia_id
      t.string :url

      t.timestamps
    end
  end
end
