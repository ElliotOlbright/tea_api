Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do 
    namespace :v1 do 
      resources :users, only: [:show, :create] do 
        resources :addresses, only: [:show, :create]
        resources :subscriptions, only: [:show, :create, :index]
        resources :cancel_subscriptions, only: [:update]
        resources :active_subscriptions, only: [:index]
        resources :archive_subscriptions, only: [:index]
      end 
    end 
  end
end
