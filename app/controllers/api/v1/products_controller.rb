class Api::V1::ProductsController < ApplicationController
    before_action :set_product, only: [:show, :index]
    # before_action :set_user
    skip_before_action :authorized


    def index 
        @products = Product.all
        render json: @products, except: [:created_at, :updated_at]
    end

    def show
        render json: @product, except: [:created_at, :updated_at]    
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find_by(params[:id])
    end

    def set_user
      @user = User.find_by(params[:user_id]) 
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:name, :brand, :product_type)
    end
end
