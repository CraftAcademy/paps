class HomeController < ApplicationController
  before_action :get_user_location

  def index
    binding.pry
    @articles = Article.all
  end

  def create
  end
 
  def get_user_location
    binding.pry
    if params['latitude'] && params['longitude']
      @user_location = [params['latitude'], params['longitude']]
    end
  end
end
