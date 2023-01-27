class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :bookmarks, dependent: :destroy
  has_many :recipes, through: :bookmarks
  has_many :recipe_comments, dependent: :destroy
  has_many :myshops, dependent: :destroy
  has_many :bookmarks_recipes, through: :bookmarks, source: :recipe
  has_many :reviews
  
  validates :name, presence: true
  validates :name, length: { maximum: 9 }
  validates :nickname, exclusion: { in: %w(管理人 管理者 スタッフ 運営), message: "「%{value}」は使えません" }
  validates :email, presence: true
  validates :encrypted_password, presence: true

  def bookmark(recipe)
    bookmarks_recipes << recipe
  end

  def self.guest
    find_or_create_by!(name: 'guestuser', email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "guestuser"
    end
  end
  
  # 登録情報編集時にパスワードを変更できないように
  def update_without_user_password(params, *options)
    params.delete(:user_password)

    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end
  
end
