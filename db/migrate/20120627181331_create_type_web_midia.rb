class CreateTypeWebMidia < ActiveRecord::Migration
  def change
    create_table :type_web_midia do |t|
      t.string :name
      t.string :logo

      t.timestamps
    end
  end
end
