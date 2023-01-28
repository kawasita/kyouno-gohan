class Public::MyshopsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_normal_user, only: [:index, :create, :destroy, :show, :edit, :update]

  def index
    @myshop = Myshop.new
    @myshops = Myshop.where(user:current_user)
  end

  def create
    @myshop = Myshop.new(myshop_params)
    @myshop.user_id = current_user.id
    if @myshop.save
      redirect_to myshops_path
    else
      @myshops = Myshop.where(user:current_user)
      render 'index', alert: '登録に失敗しました。お手数ですが再度お願いします。'
    end
  end

  def show
    @myshop = Myshop.find(params[:id])
  end


  def edit
    @myshop = Myshop.find(params[:id])
  end

  def update
    @myshop = Myshop.find(params[:id])
    if @myshop.update(myshop_params)
      redirect_to myshops_path, notice: "情報更新完了です！"
    else
      render "edit"
    end
  end

  def destroy
    @myshop = Myshop.find(params[:id])
    @myshop.destroy
    redirect_to myshops_path
  end
  
  def ensure_normal_user
    if current_user.email == 'guest@example.com'
      redirect_to users_path, alert: 'ゲストユーザーの方はこの機能をご利用できません'
    end
  end

  private

  def myshop_params
    params.require(:myshop).permit(:shop_name, :shop_url, :shop_memo)
  end

end
