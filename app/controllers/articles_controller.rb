class ArticlesController < ApplicationController

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to root_path
    else
      redirect_to new_article_path
    end
  end

  private

  def article_params
    params[:article].permit(:title, :content)
  end
end
