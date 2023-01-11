class Public::RecipesController < ApplicationController

  def index
    @categories = RakutenWebService::Recipe.small_categories
    @recipes = @categories.first.ranking
  end

  def show
    Recipe.find_or_create_by(recipe_id: params[:id])
    # @recipe = Recipe.find(params[:id])
    @recipe_comment = RecipeComment.new
  end

end