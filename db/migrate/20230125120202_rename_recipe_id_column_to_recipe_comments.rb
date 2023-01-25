class RenameRecipeIdColumnToRecipeComments < ActiveRecord::Migration[6.1]
  def change
    rename_column :recipe_comments, :recipe_id, :rakuten_recipe_id
  end
end
