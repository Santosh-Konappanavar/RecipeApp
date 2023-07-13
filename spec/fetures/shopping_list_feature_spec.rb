require 'rails_helper'

RSpec.feature 'Shopping list visit index', type: :feature do
  include Devise::Test::IntegrationHelpers

  before(:each) do
    @user = User.create(email: 'user@example.com', password: 'password', name: 'user')
    sign_in @user
    @food = Food.create(name: 'My food', measurement_unit: 'test', price: 10, quantity: 10, user: @user)
    @recipe = Recipe.create(name: 'My recipe', preparation_time: 10, cooking_time: 10, description: 'My description',
                            public: true, user: @user)
    visit shopping_list_index_path
  end

  it 'shows the header title' do
    expect(page).to have_content('My Shoppping List')
  end
end
