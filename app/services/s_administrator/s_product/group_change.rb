module SAdministrator
  module SProduct
    class GroupChange

      def initialize(params)
        @params = params
      end

      def main
        if @params[:checked_products] and @params[:checked_action]

          if @params[:checked_action] == '0'
            self.destroy
          elsif @params[:checked_action] == '1'
            self.publish
          elsif @params[:checked_action] == '2'
            self.unpublish
          end  
              

        end 
      end


      protected


      def destroy
        Product.where(id: @params[:checked_products]).each do |product|
            product.destroy
        end
      end

      def publish
        Product.where(id: @params[:checked_products]).each do |product|
            product.update_attribute(:active, true)
        end
      end

      def unpublish
        Product.where(id: @params[:checked_products]).each do |product|
            #product.update_attribute(:active, false)
            product.active = false
            product.save
        end
      end

    end
  end
end
