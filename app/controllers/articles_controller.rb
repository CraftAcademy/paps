class ArticlesController < ApplicationController
  before_action :get_coordinates, only: [:index]


  def index
    @articles = Article.all
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

  def article_params
    params[:article].permit(:title, :content)
  end

  def set_edition
    if User.near([57.7,11.9], 100).include? current_user
      @edition = 'Gothenburg Edition'
    else
      @edition = 'Rest of Sweden Edition'
    end
  end

  def get_coordinates
    @coordinates = {}
    if cookies['geocoderLocation'].present?
      @coordinates = JSON.parse(cookies['geocoderLocation']).to_hash_symbolize_keys
      set_edition
      @geocoded = true
    else
      @geocoded = false
    end
  end
end
