class RecipeComment < ApplicationRecord
  
  belongs_to :user
  belongs_to :recipe
  
  validates :comment, presence: true
  validates :comment, exclusion: { in: %w(まずい)}
  
end
