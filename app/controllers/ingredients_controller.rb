class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.all
  end

  # def show
  #     @ingredient = Ingredient.find(params[:id])
  # end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save
      redirect_to ingredients_path, notice: 'Ingredient created successfully.'
    else
      render :new
    end
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name, :description, :category, :measurement_unit)
  end
end
