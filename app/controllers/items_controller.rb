class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_recipe

  def new
    @ingredients = Ingredient.excluding(@recipe.ingredients)
    @recipe_ingredient = RecipeIngredient.new
  end

  def create
    @recipe_ingredient = @recipe.recipe_ingredients.new(recipe_ingredient_params)
    if @recipe_ingredient.save
      redirect_to @recipe
    else
      @ingredients = Ingredient.excluding(@recipe.ingredients)
      render :new, status: :unprocessable_entity
    end
  end
  
  def destroy
    @recipe.recipe_ingredients.where(id: params[:id]).destroy_all
    redirect_to @recipe
  end

  private

  def set_recipe
    @recipe = current_user.recipes.find(params[:recipe_id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end

  def recipe_ingredient_params
    params.require(:recipe_ingredient).permit(:ingredient_id, :quantity, :unit)
  end
end