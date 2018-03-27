class Api::V1::ArticlesController < ApplicationController

  def index
    articles = Article.all
    render json: articles, status: :ok
  end
end
