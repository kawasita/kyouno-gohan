class Public::ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_normal_user, only: [:create]

  
  def index
    @recipe = Recipe.find_by(params[:recipe_id])
    @recipe.reviews.find_by(user_id: current_user.id)
    if params[:light_rate]
      @reviews = Review.where(user: current_user).light_rate
    else params[:heavy_rate]
      @reviews = Review.where(user: current_user).heavy_rate
    end
  end
  
  def create
    @recipe = Recipe.find(params[:recipe_id])
    @review = current_user.reviews.new(review_params)
    @review.recipe_id = @recipe.id
    if @review.save
      redirect_to request.referer
    else
      render template: 'recipes/show'
    end
  end

  def ensure_normal_user
    if current_user.email == 'guest@example.com'
      redirect_to request.referer, alert: 'ゲストユーザーの方はこの機能をご利用できません'
    end
  end

private

  def review_params
    params.require(:recipe_comment).permit(:light_rate, :heavy_rate)
  end
end