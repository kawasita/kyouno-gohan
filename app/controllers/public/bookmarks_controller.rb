class Public::BookmarksController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_normal_user, only: [:index, :search_bookmark, :create, :destroy]

  def index
    if params[:light_rate]
      @bookmarks = Review.where(recipe_id: Recipe.where(id: Bookmark.where(user: current_user).pluck(:recipe_id))).light_rate
    elsif params[:heavy_rate]
      @bookmarks = Review.where(recipe_id: Recipe.where(id: Bookmark.where(user: current_user).pluck(:recipe_id))).heavy_rate
    else
      @bookmarks = Bookmark.where(user_id: current_user.id)
    end
  end
  
  def search_bookmark
    unless params[:keyword].blank?
      @results = current_user.recipes.where('recipe_title LIKE ?', "%#{params[:keyword]}%")
    else
      @results = []
    end
  end
  
  def create
    @recipe = Recipe.find(params[:recipe_id])
    current_user.bookmark(@recipe)
  end

  def destroy
    current_user.bookmarks.find_by(recipe_id: params[:recipe_id]).destroy
    @recipe = Recipe.find(params[:recipe_id])
  end

  def ensure_normal_user
    if current_user.email == 'guest@example.com'
      redirect_to request.referer, alert: 'ゲストユーザーの方はこの機能をご利用できません'
    end
  end
  
end