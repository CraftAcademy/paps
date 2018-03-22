class ArticlesController < ApplicationController

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

  def show
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update_attributes(article_params)
      flash[:success] = 'Article successfully updated.'
      redirect_to @article
    else
      flash[:error] = "Fields cannot be blank."
      render 'edit'
     end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash[:success] = "Article successfully deleted."
    redirect_to root_path
  end

  private

  def add_categories_to_article
    binding.pry
    categories = []
    categories << params[:article][:categories]
    categories.each do |category_id|
      category = Category.find_by(id: category_id)
      @article.categories.include?(category) ? next : @article.categories << category
    end
    binding.pry
  end

  def article_params
    params[:article].permit(:title, :content)
  end
end
