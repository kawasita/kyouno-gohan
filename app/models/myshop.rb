class Myshop < ApplicationRecord
  
  belongs_to :user
  
  validates :shop_url, presence: true
  validates :shop_name, presence: true
end
