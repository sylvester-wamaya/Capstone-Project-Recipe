require 'rails_helper'

RSpec.describe Food, type: :model do
  before :each do
    @food = Food.create(
      name: "Banana",
      measurement_unit: "grams",
      price: 200,
      quantity: 5
    )
  end

  describe "attributes" do
    it "has name" do
      expect(@food.name).to eq("Banana")
    end

    it "has measurement_unit" do
      expect(@food.measurement_unit).to eq("grams")
    end

    it "has price" do
      expect(@food.price).to eq(200)
    end

    it "has quantity" do
      expect(@food.quantity).to eq(5)
    end
  end
end
