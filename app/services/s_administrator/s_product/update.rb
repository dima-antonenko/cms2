module SAdministrator
  module SProduct
    class Update

      def initialize(product_id, params)
        @product_id = product_id
        @params = params
      end

      def main
        if @params[:images]
          @params[:images].each do |image|
            ProductAttachment.create(product_id: @product_id, image: image)
          end
        end
      end

    end
  end
end
