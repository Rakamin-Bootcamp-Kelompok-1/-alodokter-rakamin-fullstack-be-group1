class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.text :message
      t.string :payment_method
      t.integer :total_price
      
      t.timestamps
    end
  end
end
