class Public::UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index]

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
  
end