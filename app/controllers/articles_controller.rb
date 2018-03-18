class ArticlesController < ApplicationController

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:success] = "Article was successfully created."
      redirect_to @article
    else
      flash[:error] = "Field cannot be blank"
      render 'new'
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  private

  def article_params
    params[:article].permit(:title, :content, :author)
  end
end
