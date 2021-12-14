class ChangeImageNameAndDatatype < ActiveRecord::Migration[6.1]
  def change
    def self.up
      rename_column :articles, :image_url, :image_data
    end
  
    def self.down
      change_column :articles, :image_data, :text
    end
    
   
  end
end
