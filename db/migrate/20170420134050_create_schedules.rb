class CreateSchedules < ActiveRecord::Migration[5.0]
  def change
    create_table :schedules do |t|
      t.references :prescription, index: true, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.date :expiration_date
      t.string :frequency
      t.time :hours, array: true, default: []
      t.string :weekdays, array: true, default: []
      t.integer :month_days, array: true, default: []
    end
  end
end
