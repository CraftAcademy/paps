class ArticlesController < ApplicationController

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:success] = "Article Saved"
    else
      flash[:error] = "Please enter valid fields"
      render 'new'
    end
  end

  private

  def article_params
    params[:article].permit(:title, :content)
  end
end
