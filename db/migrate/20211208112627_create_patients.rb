class CreatePatients < ActiveRecord::Migration[6.1]
  def change
    create_table :patients do |t|
      t.string :patient_name
      t.string :status
      t.string :gender
      t.string :birth_date
      t.integer :age
      t.string :blood_type
      t.timestamps
    end
  end
end
