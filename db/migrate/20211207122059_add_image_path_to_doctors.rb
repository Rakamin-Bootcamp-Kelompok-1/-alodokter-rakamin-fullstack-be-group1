class AddImagePathToDoctors < ActiveRecord::Migration[6.1]
  def change
    add_column :doctors, :image_path, :string
  end
end
