require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  context 'GET /index' do
    before :each do
      get '/users/:user_id/posts'
    end

    it 'returns successful response' do
      expect(response).to be_successful
    end

    it 'returns http status 200' do
      expect(response.status).to eq(200)
    end

    it 'renders the correct view file' do
      expect(response).to render_template(:index)
    end

    it 'renders the correct placeholder' do
      expect(response.body).to include('<h1>Here is a list of posts for a given user</h1>')
    end
  end

  context 'GET /show' do
    let(:user) { FactoryBot.create(:user) }
    let(:valid_attributes) { { 'title' => 'Title', 'author' => user } }
    let(:post) { Post.create! valid_attributes }

    before :each do
      get "/users/:user_id/posts/#{post.id}"
    end

    it 'returns successful response' do
      expect(response).to be_successful
    end

    it 'returns http status 200' do
      expect(response.status).to eq(200)
    end

    it 'renders the correct view file' do
      expect(response).to render_template(:show)
    end

    it 'renders the correct placeholder' do
      expect(response.body).to include('<h1>Here is a single post</h1>')
    end
  end
end
