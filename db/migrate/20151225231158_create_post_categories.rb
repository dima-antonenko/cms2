class CreatePostCategories < ActiveRecord::Migration
  def change
    create_table :post_categories do |t|
        t.string  :name, index: true
        t.integer :post_category_id, index: true, default: 0
        t.string  :slug, index: true
        t.text    :description, index: true
        t.string  :avatar, index: true

        t.string :seo_title, index: true
        t.string :seo_description, index: true
        t.string :seo_keywords, index: true
        t.timestamps null: false
    end
  end
end
