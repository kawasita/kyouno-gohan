class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  
  def top
    @comments = RecipeComment.all
  end
  
  def destroy
    @recipe_comment = RecipeComment.find(params[:id])
    @recipe_comment.destroy
  end
  
end
