class Public::BookmarksController < ApplicationController
  before_action :authenticate_user!

  def index
    @bookmarks = Bookmark.where(user_id: current_user.id)
  end
  
  def search_bookmark
    unless params[:keyword].blank?
      @results = Bookmark.where('recipe_title LIKE ?', "%#{params[:keyword]}%")
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
end