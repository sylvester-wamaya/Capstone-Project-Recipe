require 'rails_helper'

RSpec.describe 'Recipes', type: :request do
  let(:user) { User.create(name: 'test', email: 'test@gmail.com', password: 'password') }
  let(:recipe) { Recipe.create(id: 1, name: 'Test Recipe', public: true, preparation_time: 10, cooking_time: 20) }

  before :each do
    sign_in user
  end

  describe 'GET /recipes' do
    it 'Returns successful response' do
      get recipes_path
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:index)
    end
  end
end
