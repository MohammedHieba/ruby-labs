class ArticlesController < ApplicationController


  #list of articles
  def index
    @articles = Article.all
  end

  # create new article
  def new
    @name = params['name']
    @article = Article.new
    
  end

  def create
    @article = Article.new(article_params)
    @article.save
    if @article.save
      redirect_to articles_path
    else
      render 'new'
    end
  end
   

  #edit article
  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to articles_path
    else
      render 'edit'
    end
  end


  #show article
  def show
    @article = Article.find(params[:id])
  end

  # delete an article
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end



  private

  def article_params
    params.require(:article).permit(:title, :body)
  end
end