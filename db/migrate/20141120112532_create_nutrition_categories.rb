class CreateNutritionCategories < ActiveRecord::Migration
  def change
    create_table :nutrition_categories do |t|
      t.string :title
      t.string :page_title
      t.string :url
      t.text :text
      t.integer :order
      t.has_attached_file :lead_image

      t.timestamps
    end
  end
end
