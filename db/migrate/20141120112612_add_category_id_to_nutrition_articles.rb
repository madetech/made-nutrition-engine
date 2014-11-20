class AddCategoryIdToNutritionArticles < ActiveRecord::Migration
  def change
    add_column :nutrition_articles, :category_id, :integer
  end
end
