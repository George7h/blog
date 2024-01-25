require 'rails_helper'

RSpec.describe 'Users', type: :request do
  context 'GET /index' do
    it 'returns successful response' do
      get users_path
      expect(response).to be_successful
    end

    it 'returns http status 200' do
      get users_url
      expect(response.status).to eq(200)
    end

    it 'renders the correct view file' do
      get users_url
      expect(response).to render_template(:index)
    end

    it 'renders the correct placeholder' do
      get users_url
      expect(response.body).to include('<h2>Tom</h2>')
    end
  end

  context 'GET /show' do
    let(:user) { FactoryBot.create(:user) }

    it 'returns successful response' do
      get user_url(user)
      expect(response).to be_successful
    end

    it 'returns http status 200' do
      get user_url(user)
      expect(response.status).to eq(200)
    end

    it 'renders the correct view file' do
      get user_url(user)
      expect(response).to render_template(:show)
    end

    it 'renders the correct placeholder' do
      get user_url(user)
      expect(response.body).to include('<h2>John Doe</h2>')
      expect(response.body).to include('<h2>Bio</h2>')
    end
  end
end
