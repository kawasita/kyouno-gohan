class Public::RecipesController < ApplicationController
    
  def index
    @recipes = RakutenWebService::Recipes::Recipe.all
  end
  
end