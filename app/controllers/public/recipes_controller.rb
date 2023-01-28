class Public::RecipesController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin!

  def show
    @recipe = Recipe.find(params[:id])
    @recipe_comment = RecipeComment.new
    @review = @recipe.reviews.find_by(user_id: current_user.id) || current_user.reviews.new
  end
 
end