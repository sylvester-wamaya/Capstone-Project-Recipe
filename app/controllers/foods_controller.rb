class FoodsController < ApplicationController
  load_and_authorize_resource
  def index
    @foods = Food.all
  end

  def create
    @food = Food.new(food_params)
    @food.user = current_user

    if @food.save
      redirect_to foods_path
    else
      render :new
    end
  end

  def new
    @food = Food.new
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end
end
