class ChangeProductCategory < ActiveRecord::Migration
  def change
  	remove_column :product_categories, :product_category_id
  	add_column    :product_categories, :product_category_id, :integer, index: true, default: 0
  end
end
