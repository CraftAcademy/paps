class ArticlesController < ApplicationController
  def index
    @article = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
  end

  private

  def article_params
    params[:article].permit(:title, :content)
  end
end
