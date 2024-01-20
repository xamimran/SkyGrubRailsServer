Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  post '/auth/login', to: 'authentication#login'
  resources :partner_orders
  resources :orders
  resources :order_item_modifiers
  resources :order_items
  resources :menu_item_modifiers
  resources :modifier_options
  resources :modifiers
  resources :item_prices
  resources :menu_items
  resources :hours_of_operations
  resources :users
  resources :restaurants
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :users, only: [] do
        resources :restaurants, only: [] do
          resources :menu_items, only: [] do
            resources :orders, only: [:create]
          end
        end
      end
    end
  end


  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
