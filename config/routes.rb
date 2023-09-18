Rails.application.routes.draw do
  resources :recipes
  devise_for :users

  root 'users#index'
  
  resources :foods, only: [:index, :new, :create]
end
