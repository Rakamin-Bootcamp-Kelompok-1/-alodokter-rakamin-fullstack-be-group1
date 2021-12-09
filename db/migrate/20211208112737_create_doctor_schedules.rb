class CreateDoctorSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :doctor_schedules do |t|
      t.belongs_to  :doctor
      t.string :day
      t.string :date
      t.string :month
      t.string :year
      t.string :time_practice
      t.timestamps
    end
  end
end
