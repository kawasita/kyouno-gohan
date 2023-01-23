class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  
  def top
    @comments = RecipeComment.page(params[:page]).per(10)
  end
  
  def search_comment
    unless params[:word].blank?
      @results = RecipeComment.where('comment LIKE ?', "%#{params[:word]}%").page(params[:page]).per(10)
    else
      @results = []
    end
  end
  
  def destroy
    @comment = RecipeComment.find(params[:id])
    @comment.destroy
  end
  
end