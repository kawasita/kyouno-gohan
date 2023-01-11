class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      # t.string :category_name, null: false
      # t.integer :category_id,null: false
      t.integer :recipe_id, null: false
      t.timestamps
    end
  end
end
