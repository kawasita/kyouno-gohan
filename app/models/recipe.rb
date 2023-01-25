class Recipe < ApplicationRecord
  
  has_many :bookmarks, dependent: :destroy
  has_many :recipe_comments, dependent: :destroy
  has_many :reviews, dependent: :destroy
  
  def bookmarked_by?(user)
    bookmarks.where(user_id: user).exists?
  end
  
  def reviewed_by?(user)
    reviews.where(user_id: user).exists?
  end
  
end
