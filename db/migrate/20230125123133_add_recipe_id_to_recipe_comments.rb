class AddRecipeIdToRecipeComments < ActiveRecord::Migration[6.1]
  def change
    add_column :recipe_comments, :recipe_id, :integer
  end
end
