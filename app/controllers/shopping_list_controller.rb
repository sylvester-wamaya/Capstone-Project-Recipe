class ShoppingListController < ApplicationController
  def index
    @user_foods = Food.where(user_id: current_user.id)

    @recipe = Recipe.where(user_id: current_user.id).first
    
    @recipe_food = @recipe.recipe_foods

    @all_recipe_foods = @recipe_food.includes([:food])
  end
end
