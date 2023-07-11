class RecipesController < ApplicationController
  before_action :authenticate_user!
  authorize_resource

  def index
    @user = current_user
    @recipes = @user.recipes
  end

  def show
    @user = current_user
    @recipe = Recipe.includes(:foods).find(params[:id])
  end

  def new
    @recipe = Recipe.new
    @foods = current_user.foods
  end

  def toggle_public
    @recipe = Recipe.find(params[:id])
    authorize! :toggle_public, @recipe
    @recipe.update(public: !@recipe.public)
    redirect_to @recipe, notice: 'Recipe public status updated.'
  end

  def add_ingredient
    @foods = current_user.foods
    @recipe = Recipe.find(params[:recipe_id])
    authorize! :add_ingredient, @recipe
  end

  def create_ingredient
    @recipe = Recipe.find(params[:recipe_id])
    authorize! :create_ingredient, @recipe

    food = Food.find(params[:food_id])
    @recipe.foods << food

    if @recipe.save
      redirect_to @recipe
    else
      flash.now[:error] = @recipe.errors.full_messages
      render 'foods/new'
    end
  end

  def remove_ingredient
    @recipe = Recipe.find(params[:recipe_id])
    authorize! :create_ingredient, @recipe

    food = Food.find(params[:food_id])
    @recipe.foods.delete(food)

    if @recipe.save
      redirect_to @recipe
    else
      flash.now[:error] = @recipe.errors.full_messages
      render 'foods/new'
    end
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user

    if @recipe.save
      redirect_to recipes_path
    else
      render :new
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.foods.destroy_all

    @recipe.destroy
    redirect_to recipes_path
  end

  def shopping_list
    @recipes = Recipe.all
    @missing_foods = Food.where.not(id: Food.joins(:recipes_foods)
                                      .where(recipes_foods: { recipe_id: @recipes.pluck(:id) }))

    @total_price = @missing_foods.sum(:price)
  end

  def public_recipes
    @public_recipes = Recipe.where(public: true)
    @public_recipes_with_total_price = {}

    @public_recipes.each do |recipe|
      total_price = recipe.foods.sum(:price)
      @public_recipes_with_total_price[recipe] = total_price
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
