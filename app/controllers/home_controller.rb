class HomeController < ApplicationController


  def index
    @articles = Article.all
  end

  def create
    binding.pry
  end
end
