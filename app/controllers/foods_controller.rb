class FoodsController < ApplicationController
  load_and_authorize_resource
  before_action :set_food, only: %i[show edit update destroy]

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

  def show
    @food = Food.find(params[:id])
  end

  def edit; end

  def update
    if @food.update(food_params)
      redirect_to food_path(@food)
    else
      render :edit
    end
  end

  def destroy
    if @food.destroy
      flash[:success] = 'Food item deleted successfully.'
    else
      flash[:error] = 'Failed to delete the food item.'
    end
    redirect_to foods_path
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end

  def set_food
    @food = Food.find(params[:id])
  end
end
