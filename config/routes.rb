Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }  
  resources :users, only: [:show]
  resources :microposts, only: [:index, :create]
end
