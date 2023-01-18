class Admin::HomesController < ApplicationController
  
  def top
    @recipe_comment = RecipeComment.order(created_at: :desc)
  end
  
  def destroy
    @recipe_comment = RecipeComment.find(params[:id])
    @recipe_comment.destroy
  end
  
end
