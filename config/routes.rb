Rails.application.routes.draw do
  get 'users/show'
  
  root 'home#index'
  get 'home/index'
  resources :destinations, only: [:index, :show]
  devise_for :users
  
  get 'profile', to: 'users#show'
  get "up" => "rails/health#show", as: :rails_health_check
end

