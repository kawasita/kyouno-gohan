require 'uri'
require 'net/http'

module Rakuten
  class << self
    def get_rakuten_recipes(category_id)

      # 生成元のURL
      uri = URI("https://app.rakuten.co.jp/services/api/Recipe/CategoryRanking/20170426")
      params = {
        applicationId: ENV['RWS_APPLICATION_ID'],
        categoryId: category_id,
        format: 'json'
      }
      uri.query = URI.encode_www_form(params) # paramsを付与したURLを生成する

      response = Net::HTTP.get_response(uri) # データを取得する

      response_body = JSON.parse(response.body) # 取得したJSONをパースする

      if response_body['result'].nil?
        # 例外処理
        raise response_body['error_description']
      else
        # 返ってきたレシピデータをデータベースに保存する
        response_body['result'].each do |result|
          Recipe.find_or_create_by(recipe_id: result['recipeId']) do |recipe|
            recipe.recipe_title = result['recipeTitle']
            recipe.recipe_indication = result['recipeIndication']
            recipe.recipe_description = result['recipeDescription']
            recipe.recipe_cost = result['recipeCost']
            recipe.food_image_url = result['foodImageUrl']
            recipe.recipe_url = result['recipeUrl']
          end
        end
      end

      sleep(1) # APIサーバに負荷を掛けないように一旦休憩

    end
  end
end