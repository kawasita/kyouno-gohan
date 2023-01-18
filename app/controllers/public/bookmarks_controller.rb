class Public::BookmarksController < ApplicationController
  before_action :authenticate_user!

  def index
    @bookmarks = Bookmark.where(user_id: current_user.id)
  end

  # def create
  #   @recipe = Recipe.find(params[:recipe_id])
  #   bookmark = @recipe.bookmarks.new(user_id: current_user.id)
  #   if bookmark.save
  #     redirect_to request.referer
  #   else
  #     redirect_to request.referer
  #   end
  # end

  # def destroy
  #   @recipe = Recipe.find(params[:recipe_id])
  #   bookmark = @recipe.bookmarks.find_by(user_id: current_user.id)
  #   if bookmark.present?
  #       bookmark.destroy
  #       redirect_to request.referer
  #   else
  #       redirect_to request.referer
  #   end
  # end
  def create
    @recipe = Recipe.find(params[:recipe_id])
    current_user.bookmark(@recipe)
  end

  def destroy
    current_user.bookmarks.find_by(recipe_id: params[:recipe_id]).destroy
    @recipe = Recipe.find(params[:recipe_id])

    # if bookmark.present?
    #     bookmark.destroy
    #     redirect_to request.referer
    # else
    #     redirect_to request.referer
    # end
  end
end