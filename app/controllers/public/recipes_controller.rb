class Public::RecipesController < ApplicationController
  before_action :authenticate_user!

  def show
    @recipe = Recipe.find(params[:id])
    @recipe_comment = RecipeComment.new
    # 新着コメントを上から5件取得
    # @recipe_comments_latest5 = @recipe_comments.first(5)
    # # 新着コメント3件を除く全コメントを取得 (5件以下の場合は空)
    # @recipe_comments_offset5 = @recipe_comments.offset(5)
  end
  
  # private

  # def set_recipe
  #   # PATHパラメータでrecipeを取得
  #   @recipe = Recipe.find(params[:id])
  # end

  # def set_comments
  #   # recipeに紐づくcommtnsを新着順で取得
  #   @recipe_comments = @recipe.comments.includes(:user).order('created_at DESC')
  # end

end