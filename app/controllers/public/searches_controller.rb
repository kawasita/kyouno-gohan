class Public::SearchesController < ApplicationController
  
  def search
    if params[:keyword]
      @recipes = RakutenWebService::Recipe.search(keyword: params[:keyword])
    end
  end
end
