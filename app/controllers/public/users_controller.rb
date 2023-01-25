class Public::UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :ensure_normal_user, only: [:out]

  def index
    redirect_to new_user_registration_path
  end
  
  def show
  end
  
  def out
    @user = current_user
    @user.update(is_deleted: true)
    reset_session
    redirect_to root_path, notice: '退会しました'
  end
  
  private
  
  def ensure_normal_user
    if current_user.email == 'guest@example.com'
      redirect_to users_path, alert: 'ゲストユーザーの更新・削除はできません。'
    end
  end
end