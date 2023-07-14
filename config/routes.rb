# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'

  devise_for :users

  resources :users, only: [:show]
  resources :foods
  resources :recipes, except: [:update] do
    member do
      patch 'toggle_public'
      get 'add_ingredient'
      put 'create_ingredient'
      delete 'remove_ingredient'
    end
    get 'add_ingredient', to: 'recipes#add_ingredient'
  end
  resources :ingredients, except: [:update]

  resources :shopping_list, only: [:index]

  resources :public_recipes, only: [:index]
end
