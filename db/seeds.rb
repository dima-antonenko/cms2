ProductCategory.destroy_all
Product.destroy_all
ActivityRecord.destroy_all
TimeRange.destroy_all

ProductCategory.create(id: 1, name: "Категория 1")
ProductCategory.create(id: 2, name: "Категория 2")
ProductCategory.create(id: 3, name: "Категория 1-1", product_category_id: 1)

Product.create(id: 1, product_category_id: 1, name: "Тестовый товар", description: "описание", sku: "228")


10.times do |t|
	Product.create(product_category_id: 1, name: "для удаления", description: "описание", sku: t)
end

