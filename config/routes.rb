Rails.application.routes.draw do
  
  root 'home#index'
  get 'home/index'
  resources :destinations, only: [:index, :show]
  devise_for :users
  get "up" => "rails/health#show", as: :rails_health_check
end

