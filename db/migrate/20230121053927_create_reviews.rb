class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      
      t.integer :user_id, null: false
      t.integer :recipe_id, null: false
      t.float :light_rate, null: false #あっさり味度合
      t.float :heavy_rate, null: false #こってり味度合
      t.timestamps
    end
  end
end
