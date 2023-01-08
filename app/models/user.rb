class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :bookmarks, dependent: :destroy
  has_many :recipe_comments, dependent: :destroy
  has_many :myshops, dependent: :destroy
  
  validates :name, presence: true
  validates :is_deleted, presence: true
end
