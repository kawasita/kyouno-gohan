class CreateRecipeComments < ActiveRecord::Migration[6.1]
  def change
    create_table :recipe_comments do |t|

      t.integer :user_id, null: false
      t.integer :recipe_id, null: false
      t.text :comment, null: false
      t.float :light_rate, null: false #あっさり味度合
      t.float :heavy_rate, null: false #こってり味度合
      t.timestamps
    end
  end
end
