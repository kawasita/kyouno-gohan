class Admin::HomesController < ApplicationController

  def top
    @comments = RecipeComment.order(created_at: :desc).page(params[:page]).per(10)
  end
  
  def search_comment
    unless params[:word].blank?
      @results = RecipeComment.where('comment LIKE ?', "%#{params[:word]}%")
      results_array = RecipeComment.where('comment LIKE ?', "%#{params[:word]}%")
      @results = Kaminari.paginate_array(results_array).page(params[:page]).per(20)
    else
      @results = []
    end
  end
  
  def destroy
    @comments = RecipeComment.page(params[:page]).per(10)
    comment = RecipeComment.find(params[:id])
    comment.destroy
  end
  
end