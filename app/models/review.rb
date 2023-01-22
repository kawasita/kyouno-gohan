class Review < ApplicationRecord
    
  belongs_to :user
  belongs_to :recipe
  has_many :bookmarks, through: :user
  
  validates :light_rate, :heavy_rate, presence: true
  
  # あっさり度の高い順
  scope :light_rate, -> {order(light_rate: :desc)}
  # こってり度の高い順
  scope :heavy_rate, -> {order(heavy_rate: :desc)}
  
end
