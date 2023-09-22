require 'rails_helper'

RSpec.describe 'Recipe index page', type: :feature do
  let(:user) { User.create(name: 'test', email: 'test@example.com', password: 'password') }

  let!(:recipe1) do
    Recipe.create(name: 'Risotto', preparation_time: '2', cooking_time: '3',
                  description: 'Delicious plate', public: true, user_id: user.id)
  end

  let!(:recipe2) do
    Recipe.create(name: 'Pasta', preparation_time: '2', cooking_time: '3',
                  description: 'Delicious plate', public: true, user_id: user.id)
  end

  before :each do
    sign_in user
    visit recipes_path
  end

  it 'displays a list of recipes' do
    expect(page).to have_content(recipe1.name)
    expect(page).to have_content(recipe2.name)
  end

  it 'Display button remove' do
    expect(page).to have_button('REMOVE')
  end

  it 'Checks correct link to create new recipe' do
    expect(page).to have_link('New recipe')
  end
end
