class Public::MyshopsController < ApplicationController
  
  def index
    @myshop = Myshop.new
    @myshops = Myshop.where(user:current_user)
  end

  def create
    myshop = Myshop.new(myshop_params)
    myshop.user_id = current_user.id
    myshop.save
    redirect_to myshops_path
  end
  
  def show
    
  
  def edit
    @myshop = Myshop.find(params[:id])
  end
  
  def update
    @myshop = Myshop.find(params[:id])
    if @myshop.update(myshop_params)
      redirect_to myshops_path, notice: "You have updated successfully."
    else
      render "edit"
    end
  end
  
  def destroy
    @myshop = Myshop.find(params[:id])
    @myshop.destroy
    redirect_to myshops_path
  end
  
  private
  
  def myshop_params
    params.require(:myshop).permit(:shop_name, :shop_url)
  end
  
end
