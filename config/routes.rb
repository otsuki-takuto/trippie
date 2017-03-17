Rails.application.routes.draw do

  devise_for :users
  root 'trippie#index'
 get 'trippie' => 'trippie#index'
 get 'users/:id/show' => 'trippie#show'
 get 'trippie/new' => 'trippie#new'
 post  'trippie'      =>  'trippie#create'
 patch   'trippie/:id'  => 'trippie#update'
 get   'trippie/:id/edit'  => 'trippie#edit'
 delete  'trippie/:id'  => 'trippie#destroy'
end