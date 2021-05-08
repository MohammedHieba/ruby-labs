class ArticlesController < ApplicationController
  def new
      @name = params["name"]
  end

  def create
      render plain: params[:article].inspect
  end
end
