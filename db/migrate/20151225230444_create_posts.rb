class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string  :name, index: true
      t.integer :post_category_id, index: true
      t.string  :slug, index: true
      t.text    :content, index: true
      t.string  :avatar, index: true

      t.string :seo_title, index: true
      t.string :seo_description, index: true
      t.string :seo_keywords, index: true 
      t.timestamps null: false	
    end
    add_column :product_categories, :banner, :string, index: true
  end
end
