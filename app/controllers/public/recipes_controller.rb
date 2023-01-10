class Public::RecipesController < ApplicationController

  def index
    @recipes = RakutenWebService::Recipe.small_categories
  end

  def show
    @recipe = Recipe.find(params[:id])
    @recipe_comment = RecipeComment.new
  end

end