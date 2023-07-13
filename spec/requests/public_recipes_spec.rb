require 'rails_helper'

RSpec.describe 'public recipes Index', type: :request do
  include Devise::Test::IntegrationHelpers

  before(:each) do
    @user1 = User.create(email: 'user@example.com', password: 'password', name: 'user')
    sign_in @user1
    @user2 = User.create(email: 'user4@example.com', password: 'password', name: 'user4')
    @user3 = User.create(email: 'user5@example.com', password: 'password', name: 'user5')
    @recipe1 = Recipe.create(name: 'My recipe', preparation_time: 9, cooking_time: 3, description: 'test',
                             public: false, user: @user4)
    @recipe2 = Recipe.create(name: 'My recipe1', preparation_time: 9, cooking_time: 3, description: 'test',
                             public: true, user: @user5)
    @recipe3 = Recipe.create(name: 'My recipe2', preparation_time: 9, cooking_time: 3, description: 'test',
                             public: true, user: @user1)
    get '/public_recipes'
  end

  it 'returns http success' do
    expect(response).to have_http_status(:success)
  end
  it 'return 200' do
    expect(response.status).to eq(200)
  end

  it 'renders the index template' do
    expect(response).to render_template('index')
  end

  it 'include the list of all public recipes' do
    expect(response.body).to include('Public recipes')
  end
end
