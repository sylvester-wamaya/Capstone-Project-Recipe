class ShoppingListController < ApplicationController
  def index
    user_foods = Food.where(user_id: current_user.id)
    recipe_foods = RecipeFood.where(user_id: current_user.id)

    @missing_foods = []

    user_foods.each do |user_food|
      recipe_food = recipe_foods.find_by(food_id: user_food.id)

      if recipe_food.present? && recipe_food.quantity > user_food.quantity
        missing_quantity = recipe_food.quantity - user_food.quantity
        @missing_foods << { food: user_food, missing_quantity: missing_quantity }
      end
    end
  end
end
