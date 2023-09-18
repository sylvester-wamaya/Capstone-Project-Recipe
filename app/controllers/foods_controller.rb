class FoodsController < ApplicationController
  def index
    @foods = Food.all
  end

  def create
    @food = Food.new(params.require(:food).permit(:name, :measurement_unit, :price, :quantity))
  end

  def new
    @food = Food.new
  end
end
