class AddMainArticleToArticles < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :main_article, :boolean
  end
end
