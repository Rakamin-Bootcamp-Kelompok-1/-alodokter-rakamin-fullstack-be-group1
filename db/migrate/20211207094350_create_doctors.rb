class CreateDoctors < ActiveRecord::Migration[6.1]
  def change
    create_table :doctors do |t|
      t.string :doctor_name
      t.string :speciality
      t.string :status
      t.string :star
      t.string :location_practice
      t.text :biography
      t.string :education
      t.integer :price_rate

      t.timestamps
    end
  end
end
