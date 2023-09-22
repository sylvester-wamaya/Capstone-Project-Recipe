Rails.application.routes.draw do
  devise_for :users

  resources :foods
  resources :recipe_foods
  resources :recipes
  resources :shopping_list

  root 'foods#index'
  get '/public_recipes', to: 'recipes#public_recipes'
end
