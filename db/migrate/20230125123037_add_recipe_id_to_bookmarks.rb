class AddRecipeIdToBookmarks < ActiveRecord::Migration[6.1]
  def change
    add_column :bookmarks, :recipe_id, :integer
  end
end
