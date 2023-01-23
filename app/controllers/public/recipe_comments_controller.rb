class Public::RecipeCommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_normal_user, only: [:create, :destroy]

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @comment = current_user.recipe_comments.new(recipe_comment_params)
    @comment.recipe_id = @recipe.id
    @comment.save
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    comment = RecipeComment.find(params[:id])
    comment.destroy
  end
  
  def ensure_normal_user
    if current_user.email == 'guest@example.com'
      redirect_to request.referer, alert: 'ゲストユーザーの方はこの機能をご利用できません'
    end
  end

  private

  def recipe_comment_params
    params.require(:recipe_comment).permit(:comment).merge(user_id: current_user.id, recipe_id: params[:recipe_id])
  end
end
