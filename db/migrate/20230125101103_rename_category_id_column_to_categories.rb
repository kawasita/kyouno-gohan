class RenameCategoryIdColumnToCategories < ActiveRecord::Migration[6.1]
  def change
    rename_column :categories, :category_id, :rakuten_category_id
  end
end
