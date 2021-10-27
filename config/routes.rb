Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }  
  resources :users, only: [:show]
  resources :microposts, only: [:index, :create]
  resources :followings, only: [:create]
  get 'following_user_microposts/index'
  resources :likings, only: [:create]
end
