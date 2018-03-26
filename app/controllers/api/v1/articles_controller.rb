class Api::V1::ArticlesController < ApplicationController
  def index
    article = Article.all
    binding.pry
    render json: {data: "#{article}"}
  end
end
