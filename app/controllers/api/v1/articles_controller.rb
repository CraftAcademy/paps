class Api::V1::ArticlesController < ApplicationController
respond_to :json
  def index
    @articles = Article.all
    respond_with @articles
  end
end
