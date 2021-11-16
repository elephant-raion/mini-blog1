Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }  
  resources :users, only: [:show]
  resources :microposts, only: [:index, :create]
  resources :followings, only: [:create]
  resources :following_user_microposts, only: %i[index]
  resources :likings, only: [:create]
  resources :liking_users, only: %i[index]
  resources :comments, only: %i[index create]
end
