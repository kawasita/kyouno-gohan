class Public::SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    unless params[:keyword].blank?
      categories = Category.where('name LIKE ?', "%#{params[:keyword]}%").pluck(:category_id)

      # ランダムに5件のカテゴリーを取得
      categories.sample(5).each do |category|
        Rakuten.get_rakuten_recipes(category)
      end

      @results = Recipe.where('recipe_title LIKE ?', "%#{params[:keyword]}%")
    else
      @results = []
    end
  end

end
