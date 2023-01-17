class Public::RecipesController < ApplicationController

  def show
    @recipe = Recipe.find(params[:id])
    @recipe_comment = RecipeComment.new
  end

end