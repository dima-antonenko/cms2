class Administrators::ProductAttacmentsController < AdministratorsController

  before_action :set_product_attacment, only: [:edit, :update, :destroy, :delete]


  def destroy
    @product_attacment.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Товар удален' }
    end
  end

  private

  def product_attacment_params
    params.require(:product_attacment).permit(:image)
  end

  def set_product_attacment
    @product_attacment = ProductAttacment.find(params[:id])
  end

end