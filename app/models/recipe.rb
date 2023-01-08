class Recipe < ApplicationRecord
  
  has_many :bookmarks, dependent: :destroy
  has_many :recipe_comments, dependent: :destroy
end
