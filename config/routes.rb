Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do 
    namespace :v1 do 
      resources :users, only: [:show, :create] do 
        resources :addresses, only: [:show, :create]
        resources :subscriptions, only: [:show, :create]
        resources :cancel_subscriptions, only: [:update]
      end 
    end 
  end
end
