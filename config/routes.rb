Rails.application.routes.draw do
  resources :recipe_foods
  resources :recipes
  devise_for :users

  root 'users#index'
  get '/public_recipes', to: 'recipes#public_recipes'
  resources :foods, only: [:index, :new, :create]
end
