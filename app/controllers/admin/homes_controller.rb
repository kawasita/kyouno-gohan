class Admin::HomesController < ApplicationController
  
  def top
    @comment_recipe_ids = RecipeComment.order(created_at: :desc).pluck(:recipe_id) # 最新のものから並べる
    @comment_recipes = []
    @comment_recipe_ids.each do |comment_recipe_id|
      @comment_recipes << Recipe.find(comment_recipe_id)
    end
  end
  
end
