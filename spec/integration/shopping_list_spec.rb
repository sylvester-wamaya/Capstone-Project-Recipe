require 'rails_helper'

RSpec.describe 'Shopping list page', type: :feature do
  let(:user) { User.create(name: 'test', email: 'test@gmail.com', password: 'password') }

  before :each do
    sign_in user
  end

  it 'should create a food, then show it in the shopping list' do
    # create a food
    visit foods_path
    click_link 'New Food'
    fill_in 'Name of food', with: 'test food'
    fill_in 'Measurement unit', with: 'test unit'
    fill_in 'Price', with: '1.0'
    fill_in 'Quantity', with: '1'
    click_button 'Create Food'

    # visit the shopping list
    visit shopping_list_index_path

    # check and see if the food is added to the shopping list properly
    expect(page).to have_content('test food')
  end

  it "shouldn't show a food in the shopping list if it's in a recipe" do
    # create a food
    visit foods_path
    click_link 'New Food'
    fill_in 'Name of food', with: 'test food'
    fill_in 'Measurement unit', with: 'test unit'
    fill_in 'Price', with: '1.0'
    fill_in 'Quantity', with: '1'
    click_button 'Create Food'

    # create a recipe
    visit recipes_path
    click_link 'New recipe'
    fill_in 'Name', with: 'test recipe'
    fill_in 'Preparation time', with: '1'
    fill_in 'Cooking time', with: '1'
    fill_in 'Description', with: 'test description'
    click_button 'Create Recipe'

    # add the food to the recipe
    visit recipes_path
    click_link 'test recipe'
    click_link 'Add ingredient'
    fill_in 'Quantity', with: '1'
    click_button 'Create Recipe food'

    # visit the shopping list
    visit shopping_list_index_path

    # check and see if the food is added to the shopping list properly
    expect(page).to_not have_content('test food')
  end
end
