class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :full_name
      t.string :password_digest
      t.integer :age
      t.string :email
      t.string :gender
      t.string :birth_date
      t.integer :phone_number
      t.string :image_path
      t.boolean :is_admin
      t.boolean :is_active

      t.timestamps
    end
  end
end
