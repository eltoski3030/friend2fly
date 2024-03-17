Rails.application.routes.draw do
  get 'users/show'
  
  root 'home#index'
  get 'home/index'
  resources :destinations do
    resources :comments, only: [:create, :edit, :update, :destroy] 
  end
  devise_for :users
  
  get 'profile', to: 'users#show'
  get "up" => "rails/health#show", as: :rails_health_check
end

