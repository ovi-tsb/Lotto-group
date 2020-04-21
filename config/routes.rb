Rails.application.routes.draw do
  

  get 'groups/index'
  get 'groups/edit'
  get 'groups/create'
  get 'groups/destroy'
  get 'groups/show'
  get 'groups/new'
  devise_for :users

  resources :users
  resources :max_wining_numbers
  resources :six49_wining_numbers
  resources :lottario_wining_numbers
  resources :games
  resources :groups
  resources :invites

  devise_for :users

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'static#homepage'

  


end
