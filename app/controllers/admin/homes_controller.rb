class Admin::HomesController < ApplicationController
  
  def top
    @comments = RecipeComment.all
  end
  
  def destroy
    @recipe_comment = RecipeComment.find(params[:id])
    @recipe_comment.destroy
  end
  
end
