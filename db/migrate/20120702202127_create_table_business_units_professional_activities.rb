class CreateTableBusinessUnitsProfessionalActivities < ActiveRecord::Migration
  def up
    create_table :business_units_professional_activities, :id => false do |t|
      t.references :business_unit
      t.references :professional_activity
    end
  end

  def down
    drop_table :business_units_professional_activities
  end
end
