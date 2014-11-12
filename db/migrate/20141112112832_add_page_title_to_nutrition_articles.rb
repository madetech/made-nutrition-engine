class AddPageTitleToNutritionArticles < ActiveRecord::Migration
  def change
    add_column :nutrition_articles, :page_title, :string
  end
end
