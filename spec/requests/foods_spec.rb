require 'rails_helper'

RSpec.describe 'Foods', type: :request do
  describe 'GET /foods' do
    let(:user) { User.create(name: 'test', email: 'test@gmail.com', password: 'password') }

    before :each do
      sign_in user
      get foods_path
    end

    it 'returns a successful response' do
      expect(response).to have_http_status(200)
    end

    it 'returns the index view' do
      expect(response).to render_template('index')
    end
  end

  describe 'GET /foods/new' do
    let(:user) { User.create(name: 'test', email: 'test@gmail.com', password: 'password') }

    before :each do
      sign_in user
      get new_food_path
    end

    it 'returns a successful response' do
      expect(response).to have_http_status(200)
    end

    it 'returns the new view' do
      expect(response).to render_template('new')
    end

    it 'assigns a new food to @food' do
      expect(assigns(:food)).to be_a_new(Food)
    end
  end
end
