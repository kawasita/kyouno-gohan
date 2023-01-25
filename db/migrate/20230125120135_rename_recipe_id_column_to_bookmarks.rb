class RenameRecipeIdColumnToBookmarks < ActiveRecord::Migration[6.1]
  def change
    rename_column :bookmarks, :recipe_id, :rakuten_recipe_id
  end
end
