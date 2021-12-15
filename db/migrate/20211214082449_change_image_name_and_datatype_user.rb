class ChangeImageNameAndDatatypeUser < ActiveRecord::Migration[6.1]
  def change
      rename_column :users, :image_path, :image_data  
  end
end
