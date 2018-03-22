class HomeController < ApplicationController
  before_action :get_coordinates, only: [:index]

  def index
     if cookies['geocoderLocation'].present? && Article.near(current_user.address, 20).any?
       @articles = Article.near(current_user.address, 20)
     else
       @articles = Article.all
     end
  end

  def set_edition
    if User.near([57.700501, 11.975463], 50).include? current_user
      @edition = 'Gothenburg Edition'
    else
      @edition = 'Rest of Sweden Edition'
    end
  end

  def get_coordinates
    @coordinates = {}
    if cookies['geocoderLocation'].present?
      @coordinates = JSON.parse(cookies['geocoderLocation']).to_hash.symbolize_keys
      update_current_user_location
      set_edition
      @geocoded = true
    else
      @geocoded = false
    end
  end

  def update_current_user_location
    current_user.latitude = @coordinates.values.first
    current_user.longitude = @coordinates.values.second
    current_user.save
  end

end
