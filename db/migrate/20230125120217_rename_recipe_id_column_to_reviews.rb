class RenameRecipeIdColumnToReviews < ActiveRecord::Migration[6.1]
  def change
    rename_column :reviews, :recipe_id, :rakuten_recipe_id
  end
end
