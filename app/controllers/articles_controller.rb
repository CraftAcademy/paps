class ArticlesController < ApplicationController
  before_action :find_articles_and_categories, only: [:show, :update, :edit, :destroy]
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    add_categories_to_article
    if @article.save
      flash[:success] = "Article was successfully created."
      redirect_to @article
    else
      flash[:error] = "Field cannot be blank!"
      render 'new'
    end
  end

  def update
    if @article.update_attributes(article_params)
      flash[:success] = 'Article successfully updated.'
      redirect_to @article
    else
      flash[:error] = "Fields cannot be blank."
      render 'edit'
     end
  end

  def destroy
    @article.destroy
    flash[:success] = "Article successfully deleted."
    redirect_to root_path
  end

  private

  def find_articles_and_categories
    @article = Article.find(params[:id])
    @categories = Category.all
  end

  def add_categories_to_article
    if !params[:article][:categories].nil?
      category_id = params[:article][:categories]
      category = Category.find_by(id: category_id)
      @article.categories << category unless @article.categories.include?(category)
    end
  end

  def article_params
    params[:article].permit(:title, :content)
  end

end
