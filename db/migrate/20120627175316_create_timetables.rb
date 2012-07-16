class CreateTimetables < ActiveRecord::Migration
  def change
    create_table :timetables do |t|
      t.integer :business_unit_id
      t.string :start_date
      t.string :end_date
      t.string :start_time
      t.string :end_time

      t.timestamps
    end
  end
end
