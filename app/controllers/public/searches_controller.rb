class Public::SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    unless params[:keyword].blank?
      categories = Category.where('name LIKE ?', "%#{params[:keyword]}%").pluck(:rakuten_category_id)

      # ランダムに5件のカテゴリーを取得
      categories.sample(4).each do |category|
       Rakuten.get_rakuten_recipes(category)
      end
      @results = Recipe.where('recipe_title LIKE ?', "%#{params[:keyword]}%")
      # 配列に対するページネーション
      results_array = Recipe.where('recipe_title LIKE ?', "%#{params[:keyword]}%")
      @results = Kaminari.paginate_array(results_array).page(params[:page]).per(9)
    else
      @results = []
    end
  end

end
