Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :products, only: [:index, :show]
      resources :subscriptions 
      resources :users, only: [:create, :index, :show] do
        resources :subscriptions 
      end
      
      post '/login', to: 'users#login'
      get "/auto_login", to: "users#auto_login"

      # get '/auth/google_oauth2/callback', to: 'auth#omniauth'
      get '/auth/:provider/callback', to: 'auth#omniauth'
    end
  end

end
