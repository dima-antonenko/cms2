class CreateStaticPages < ActiveRecord::Migration
  def change
    create_table :static_pages do |t|
      t.string  :name, index: true
      t.string  :slug, index: true
      t.text    :content, index: true

      t.string :seo_title, index: true
      t.string :seo_description, index: true
      t.string :seo_keywords, index: true 
      t.timestamps null: false	
    end
  end
end
