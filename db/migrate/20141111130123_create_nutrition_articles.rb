class CreateNutritionArticles < ActiveRecord::Migration
  def change
    create_table :nutrition_articles do |t|
      t.string :title
      t.string :url
      t.text :text
      t.boolean :published, default: false
      t.integer :order
      t.has_attached_file :lead_image

      t.timestamps
    end
  end
end
