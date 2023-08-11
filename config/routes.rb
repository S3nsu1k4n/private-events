Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  resources :events, only: [:index, :new, :create]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "events#index"
end
