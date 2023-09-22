require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
    subject {RecipeFood.new(quantity: 1, recipe_id: 1, food_id: 1)}

    before { subject.save }

  
  
    it 'Quantity should be present' do
        subject.quantity = nil
        expect(subject).to_not be_valid
    end

    it 'Quantity should be postive number' do
        subject.quantity = -1
        expect(subject).to_not be_valid
    end
end