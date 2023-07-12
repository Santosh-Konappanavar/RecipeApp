class ShoppingListController < ApplicationController
  def index
    recipe_foods = []

    current_user.recipes.each do |recipe|
      recipe.foods.each do |food|
        recipe_foods << food unless recipe_foods.include? food
      end
    end

    @list = []

    current_user.foods.each do |food|
      @list << food unless recipe_foods.include? food
    end

    @total_food_value = @list.sum(&:price)
  end
end
