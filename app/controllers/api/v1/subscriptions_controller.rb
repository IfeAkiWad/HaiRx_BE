class Api::V1::SubscriptionsController < ApplicationController
    before_action :set_subscription, only: [:show, :index, :update, :delete]
    before_action :set_user, :set_product
    # skip_before_action :authorized

    def index 
        @subscriptions = Subscription.all
        render json: @subscriptions, except: [:created_at, :updated_at]
    end

    def show
        find_subscription
        render json: @subscription, except: [:created_at, :updated_at]
    end

    def create 
        @subscription = current_user.subscriptions.new(subscription_params) 
            if @subscription.save
                render json: @subscription, status: :created, location: @subscription
            else
                render json: @subscription.errors, status: :unprocessable_entity            
            end
    end

    def update
        if @subscription.update(subscription_params)
            render json: @subscription
        else
            render json: @subscription.errors, status: :unprocessable_entity
        end
    end

    def destroy
        find_subscription
        @subscription.destroy
        render json: {message: "Successfully deleted #{@product.name}!"}
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_subscription
      @subscription = Subscription.where(params[:id])
    end

    def find_subscription
        @subscription = Subscription.find(params[:id])
    end

    def set_user
      @user = User.find_by(params[:user_id]) 
    end

    def set_product
        @product = Product.find_by(params[:product_id]) 
      end

    # Only allow a list of trusted parameters through.
    def subscription_params
      params.require(:subscription).permit(:frequency, :product_id, :user_id)
    end
end
