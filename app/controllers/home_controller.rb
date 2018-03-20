class HomeController < ApplicationController
  before_action :current_user_location

  def index
    @articles = Article.all
  end

  def current_user_location
    binding.pry
    @current_user_location = geocoded_by :full_street_address
  end
end
