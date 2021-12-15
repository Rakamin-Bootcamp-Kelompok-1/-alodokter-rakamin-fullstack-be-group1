class RenameColumnImage < ActiveRecord::Migration[6.1]
  def change
    rename_column :articles, :image_url, :image_data
  end
end
