require 'rails_helper'

RSpec.describe "Recipes", type: :request do
    let(:recipe){Recipe.create(id: 1, name: "Test Recipe", public: true, preparation_time: 10, cooking_time: 20)}
    describe "GET /recipes" do
        it "works! (now write some real specs)" do
            

            get recipes_path
            expect(response).to have_http_status(:success)
      expect(response).to render_template(:index)
      expect(response.body).to include(recipe.name)
        end
    end
    describe "GET /recipes/:id" do
        it "works! (now write some real specs)" do
            get recipe_path(recipe)
            expect(response).to have_http_status(:success)
      expect(response).to render_template(:show)
      expect(response.body).to include(recipe.name)
        end
    end
end