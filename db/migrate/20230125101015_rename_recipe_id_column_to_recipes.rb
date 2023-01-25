class RenameRecipeIdColumnToRecipes < ActiveRecord::Migration[6.1]
  def change
    rename_column :recipes, :recipe_id, :rakuten_recipe_id
  end
end
