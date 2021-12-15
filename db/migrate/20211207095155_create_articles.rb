class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string :article_category
      t.string :article_title
      t.string :image_url
      t.text :content_desc
      t.integer :id_user
      t.boolean :main_article

      t.timestamps
    end
  end
end
