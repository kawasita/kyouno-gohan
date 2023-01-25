require 'uri'
require 'net/http'

module Rakuten
  class << self
    def get_rakuten_recipes(rakuten_category_id)

      # 生成元のURL
      uri = URI("https://app.rakuten.co.jp/services/api/Recipe/CategoryRanking/20170426")
      params = {
        applicationId: ENV['RWS_APPLICATION_ID'],
        categoryId: rakuten_category_id,
        format: 'json'
      }
      uri.query = URI.encode_www_form(params) # paramsを付与したURLを生成

      response = Net::HTTP.get_response(uri) # データを取得

      response_body = JSON.parse(response.body) # 取得したJSONをパース
      
      if response_body['result'].nil?
        # 例外処理
        raise response_body['error_description']
      else
         # 返ってきたレシピデータをデータベースに保存
        response_body['result'].each do |result|
          Recipe.find_or_create_by(rakuten_recipe_id: result['recipeId']) do |recipe|
            #recipe.category_id = category_id
            recipe.recipe_title = result['recipeTitle']
            recipe.recipe_indication = result['recipeIndication']
            recipe.recipe_description = result['recipeDescription']
            recipe.recipe_cost = result['recipeCost']
            recipe.food_image_url = result['foodImageUrl']
            recipe.recipe_url = result['recipeUrl']
          end
        end
        sleep(1) # APIサーバに負荷を掛けないように一旦休憩
      end

    end
  end
end



