class ArticlesController < ApplicationController
  def index
    @article = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article, notice: "Article was successfully created."
    else
      render 'new', notice: "Please enter text"
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  private

  def article_params
    params[:article].permit(:title, :content)
  end
end
