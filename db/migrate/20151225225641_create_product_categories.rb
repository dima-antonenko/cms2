class CreateProductCategories < ActiveRecord::Migration
  def change
    create_table :product_categories do |t|
      t.integer :product_category_id, index: true
      t.string  :name, index: true
      t.string  :slug, index: true
      t.string  :avatar, index: true
      t.text    :description, index: true

      t.string :seo_title, index: true
      t.string :seo_description, index: true
      t.string :seo_keywords, index: true 
      t.timestamps null: false
    end
  end
end
