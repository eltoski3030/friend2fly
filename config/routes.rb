Rails.application.routes.draw do
  root 'home#index'
  get 'home/index'
  resources :destinations, only: [:index, :show]

  get "up" => "rails/health#show", as: :rails_health_check
end

