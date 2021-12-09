class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.text :message
      t.string :payment_method
      t.integer :total_price
      t.belongs_to :doctor
      t.belongs_to :patient
      t.belongs_to :doctor_schedule
      t.timestamps
    end
  end
end
