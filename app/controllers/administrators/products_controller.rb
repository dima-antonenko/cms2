class Administrators::ProductsController < AdministratorsController

  include ProductCategoryHelper
  include InterfaceHelper

  before_action :set_product, only: [:edit, :update, :destroy, :sales, :views, :back_calls, :questions, :add_to_favorites]

  def index
    @actions = [['Удалить', 0], ['Опубликовать', 1], ['Снять с публикации', 2]]
    @products = Product.all.order(:created_at)
  end

  def edit
    @product_attachments = ProductAttachment.where(product_id: @product.id)
    @product_categories  = ProductCategory.all.collect {|category| [category.name, category.id ]}
  end

  def update
    @product.update_attributes(product_params)
    #SAdministrator::SProduct::Update.new(@product.id, params).main


    if params[:images]
      params[:images].each do |image|
        puts "zz"
        #ProductAttachment.create(product_id: @product.id, image: image)
      end
    end

    respond_to do |format|
      if @product.save
        format.html { redirect_to :back, notice: 'Информация обновлена' }
      else
        format.html {  redirect_to :back, notice: 'Произошла ошибка' }
      end
    end
  end



  def destroy
    #SellerProductDestroy.new(@product).destroy_product
    @product.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Товар удален' }
    end
  end


  def checked
    SAdministrator::SProduct::GroupChange.new(params).main
    respond_to do |format|
      format.html {  redirect_to :back, notice: 'Товар удален' }
    end
  end

  def sales
    gon.push({
               mount_total_labels:        AdministratorProductSales.new(@product.id).mount_total_labels,
               mount_total_series:        AdministratorProductSales.new(@product.id).mount_total_series,
               mount_times_sales_stolb:   AdministratorProductSales.new(@product.id).mount_times_sales_stolb,
               mount_times_sales_rounded: AdministratorProductSales.new(@product.id).mount_times_sales_rounded
    })
  end

  def views
    gon.push({
               mount_total_labels:        AdministratorProductViews.new(@product.id).mount_total_labels,
               mount_total_series:        AdministratorProductViews.new(@product.id).mount_total_series,
               mount_times_views_stolb:   AdministratorProductViews.new(@product.id).mount_times_views_stolb,
               mount_times_views_rounded: AdministratorProductViews.new(@product.id).mount_times_views_rounded
    })
  end

  def back_calls
    gon.push({
               mount_total_labels:             AdministratorProductBackCalls.new(@product.id).mount_total_labels,
               mount_total_series:             AdministratorProductBackCalls.new(@product.id).mount_total_series,
               mount_times_back_calls_stolb:   AdministratorProductBackCalls.new(@product.id).mount_times_back_calls_stolb,
               mount_times_back_calls_rounded: AdministratorProductBackCalls.new(@product.id).mount_times_back_calls_rounded
    })
  end

  def questions
    gon.push({
               mount_total_labels:             AdministratorProductQuestions.new(@product.id).mount_total_labels,
               mount_total_series:             AdministratorProductQuestions.new(@product.id).mount_total_series,
               mount_times_questions_stolb:    AdministratorProductQuestions.new(@product.id).mount_times_questions_stolb,
               mount_times_questions_rounded:  AdministratorProductQuestions.new(@product.id).mount_times_questions_rounded
    })
  end

  def add_to_favorites
    gon.push({
               mount_total_labels:             AdministratorProductAddToFavorites.new(@product.id).mount_total_labels,
               mount_total_series:             AdministratorProductAddToFavorites.new(@product.id).mount_total_series,
               mount_times_questions_stolb:    AdministratorProductAddToFavorites.new(@product.id).mount_times_add_to_favorites_stolb,
               mount_times_questions_rounded:  AdministratorProductAddToFavorites.new(@product.id).mount_times_add_to_favorites_rounded
    })
  end


  private

  def set_product
    @product = Product.friendly.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :avatar, :price, :product_category_id, :sku, :description,
     :stock, :active, :checked_action, :checked_products[])

  end

end
