require 'rails_helper'

RSpec.describe Recipe, type: :model do
    subject {Recipe.new(name: "Test Recipe", public: true, preparation_time: 10, cooking_time: 20)}

    before { subject.save }

  
  
    it 'Name should be present' do
        subject.name = nil
        expect(subject).to_not be_valid
    end

    it 'Public should be present' do
        subject.public = nil
        expect(subject).to_not be_valid
    end

    it 'Preparation time should be greater than or equal to 0' do
        subject.preparation_time = -1
        expect(subject).to_not be_valid
    end

    it 'Cooking time should be greater than or equal to 0' do
        subject.cooking_time = -1
        expect(subject).to_not be_valid
    end

end