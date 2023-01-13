class Public::HomesController < ApplicationController

  def top
    # SQLiteとMySQlでは、ランダムの取得が違うためSQLを生成
    rand_sql = Rails.env.development? ? 'RANDOM()' : 'RAND()'
    @random_recipes = Recipe.order(rand_sql).limit(4)
    random_comment_recipe_ids = RecipeComment.order(created_at: :desc).pluck(:recipe_id).take(4).uniq # 最新のものから並べる
    @random_comment_recipes = []
    random_comment_recipe_ids.each do |random_comment_recipe_id|
      @random_comment_recipes << Recipe.find(random_comment_recipe_id)
    end
  end

  def about
  end

end
