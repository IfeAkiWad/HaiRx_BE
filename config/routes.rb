Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :subscriptions 
      resources :users, only: [:create, :index, :show] do
        resources :products, only: [:index, :show] 
      end
      post '/login', to: 'users#login'
      get "/auto_login", to: "users#auto_login"
    end
  end

end
