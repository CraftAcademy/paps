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

  def update
    @article = Article.find(params[:id])
    if @article.update(params[:article])
      flash[:success] = 'Article successfully updated'
      redirect_to article_path(@article)
    else
      flash[:error] = error_message(@article)
      render 'edit'
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  private

  def article_params
    params[:article].permit(:title, :content)
  end
end
