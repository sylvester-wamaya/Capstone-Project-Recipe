Rails.application.routes.draw do
  resources :recipe_foods
  resources :recipes
  resources :shopping_list
  devise_for :users



  get '/public_recipes', to: 'recipes#public_recipes'
  root 'foods#index'

  resources :foods, only: [:index, :new, :create]
end
