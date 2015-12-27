module ProductCategoryHelper

  def get_parent_category(product_category)
    if product_category.product_category_id == 0
      'Родительская категория'
    else
    	product_category.product_category.name
    end
  end

end
