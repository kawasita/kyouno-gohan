class Public::RecipeCommentsController < ApplicationController

  def create
    @comment = RecipeComment.new(recipe_comment_params)
    @comment.save
    redirect_to recipe_path(params[:recipe_id])
  end

  def destroy
    @comment = RecipeComment.find(params[:id])
    @comment.destroy
  end

  private

  def recipe_comment_params
    params.require(:recipe_comment).permit(:comment).merge(user_id: current_user.id, recipe_id: params[:recipe_id])
  end
end
