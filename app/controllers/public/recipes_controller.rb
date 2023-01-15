class Public::RecipesController < ApplicationController

  def index
    #@category = RakutenWebService::Recipe.large_categories
    @categories = RakutenWebService::Recipe.small_categories
    @recipes = @categories.first.ranking
  end

  def show
    @recipe = Recipe.find(params[:id])
    @recipe_comment = RecipeComment.new
  end

end