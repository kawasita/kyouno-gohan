class RecipeComment < ApplicationRecord
  
  belongs_to :user
  belongs_to :recipe
  
  validates :comment, presence: true
  validates :comment, exclusion: { in: %w(まずい), message: "「%{value}」は使えません" }
  
end
