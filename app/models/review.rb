class Review < ApplicationRecord
    
  belongs_to :user
  belongs_to :recipe
  
  validates :light_rate, :heavy_rate, presence: true
  
end
