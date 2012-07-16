class AddBusinessUnitIdToWebMidia < ActiveRecord::Migration
  def change
    add_column :web_midia, :business_unit_id, :integer
  end
end
