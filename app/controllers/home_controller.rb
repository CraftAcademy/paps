class HomeController < ApplicationController
  before_action :current_user_location

  def index
    @articles = Article.all
  end

  def current_user_location

  end
end
