class AddTypeToNutritionArticles < ActiveRecord::Migration
  def change
    add_column :nutrition_articles, :type, :string
  end
end
