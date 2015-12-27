class ChangeProduct < ActiveRecord::Migration
  def change
  	remove_column :products, :product_category_id
  	add_column    :products, :product_category_id, :integer, index: true, default: 0
  end
end
