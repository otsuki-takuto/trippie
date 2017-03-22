Rails.application.routes.draw do

  devise_for :users
  root 'trippie#index'
  resources :trippie
  get 'users/:id/show' => 'users#show'
  get 'trippie/:id/show' => 'trippie#show'
  resources :trippie do
    resources :comments, only: [:create]
    end
  resources :users, only: [:show]
  end