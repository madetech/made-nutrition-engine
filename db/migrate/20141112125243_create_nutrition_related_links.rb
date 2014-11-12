class CreateNutritionRelatedLinks < ActiveRecord::Migration
  def change
    create_table :nutrition_related_links do |t|
      t.string :title
      t.text   :text
      t.string :url
      t.attachment :image
      t.integer :article_id
      t.integer :order

      t.timestamps
    end
  end
end
