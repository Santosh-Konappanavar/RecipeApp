require 'rails_helper'

RSpec.feature 'Shopping list visit index', type: :feature do
  include Devise::Test::IntegrationHelpers

  before(:each) do
    @user = User.create(email: 'user@example.com', password: 'password', name: 'user')
    sign_in @user
    @food = Food.create(name: 'food', measurement_unit: 'test', price: 110, quantity: 101, user: @user)
    @recipe = Recipe.create(name: 'recipe', preparation_time: 11, cooking_time: 11, description: 'My description',
                            public: true, user: @user)
    visit shopping_list_index_path
  end

  it 'shows the header title' do
    expect(page).to have_content('My Shoppping List')
  end
end
