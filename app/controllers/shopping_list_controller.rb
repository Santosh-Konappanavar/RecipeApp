class ShoppingListController < ApplicationController
  def index
    foods_recipes = []

    current_user.recipes.each do |recipe|
      recipe.foods.each do |food|
        foods_recipes << food unless foods_recipes.include? food
      end
    end

    @list = []

    current_user.foods.each do |food|
      @list << food unless foods_recipes.include? food
    end

    @total_food_value = @list.sum(&:price)
  end
end
