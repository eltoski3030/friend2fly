Rails.application.routes.draw do
  get 'users/show'

  root 'home#index'
  get 'home/index'
  get 'destinations/index'
  resources :destinations do
    member do
      post 'upvote'
      post 'downvote'
    end
    resources :comments, only: [:create, :edit, :update, :destroy] 
  end
  devise_for :users
  
  get 'profile', to: 'users#show'
  get "up" => "rails/health#show", as: :rails_health_check
end

