class HomeController < ApplicationController
  def index
    @article = Article.all
  end
end
