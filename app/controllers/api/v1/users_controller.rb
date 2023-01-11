class Api::V1::UsersController < ApplicationController
  before_action :set_user, except: [:update, :delete]
  skip_before_action :authorized, except: [:auto_login]

    def index
     user = User.all 
     render json: user, include: [:subscriptions]
    end
 
    def create
     user = User.create(user_params)
     if user.valid?
       payload = {user_id: user.id}
       token = encode_token(payload)
        render json: {user: user, jwt: token},status: :created
     else
       render json: {errors: user.errors.full_messages}
     end
   end

   def show
    render json: @user, except: [:created_at, :updated_at], include: [:subscriptions]
    end
 
   def login
     user = User.find_by(email: params[:user][:email])
 
     if user && user.authenticate(params[:user][:password])
       
        payload = {user_id: user.id}
       token = encode_token(payload)
      
       render json: {user: user, jwt: token}
     else
       render json: {error: "Invalid Email or password"}
     end
   end
 
   def auto_login
       render json: current_user
   end
 
   private

      def set_user
        @user = User.find_by(params[:user_id]) 
      end
 
     def user_params
       params.require(:user).permit( :password, :email, subscriptions_attribute: [:frequency])
     end
end
