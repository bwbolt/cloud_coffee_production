class UserCurrentProductsController < ApplicationController

    def index
        
        @products = Current.user.current_products
        
        
    end

   def new
        @current_product = CurrentProduct.new
   end


   def create
        @current_product = CurrentProduct.new(current_product_params)
        

        
        @current_product.user_id = Current.user.id
        if @current_product.save
            redirect_to user_current_products_path(Current.user)
        else
            render :new
        end
   end

   def destroy
    
  
    
        @current_product = CurrentProduct.find(params[:id])
        
        
        @current_product.destroy
        redirect_to user_current_products_path(Current.user)
    end



   private

   def current_product_params
        params.require(:current_product).permit(:name, :details)
   end

end
