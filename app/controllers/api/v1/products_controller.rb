class Api::V1::ProductsController < ApplicationController
    before_action :set_product, only: [:show, :index]

    def index 
        @products = Product.all
    end

    def show
        @product = Product.find(params[:id])
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      product = Product.where(params[:id])
    end

    def set_user
      user = User.find_by(params[:user_id]) 
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:name, :brand, :product_type)
    end
end
