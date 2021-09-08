Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users
  get 'users/show/:id', to: 'users#show'
  resources :microposts, only: [:index, :create]
end
