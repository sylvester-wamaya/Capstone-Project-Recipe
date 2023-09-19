class ShoppingListController < ApplicationController
  def index
    user_foods = Food.where(user_id: current_user.id)
    recipe_foods = Food.joins(:recipes).where(recipes: { user_id: current_user.id })
    @unused_foods = user_foods - recipe_foods
  end
end
