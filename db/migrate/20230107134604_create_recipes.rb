class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.integer :recipe_id, null: false
      t.string :recipe_title, null: false # タイトル
      t.string :recipe_indication, null: false # 時間
      t.text :recipe_description, null: false # 説明
      t.string :recipe_cost, null: false # コスト
      t.string :food_image_url, null: false # 画像
      t.string :recipe_url, null: false # URL
      t.timestamps
    end
  end
end
