class AddWebMidiaIdToTypeWebMidia < ActiveRecord::Migration
  def change
    add_column :type_web_midia, :web_midia_id, :integer
  end
end
