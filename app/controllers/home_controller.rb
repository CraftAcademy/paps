class HomeController < ApplicationController
  before_action :get_coordinates, only: [:index]

  def index
     if !@coordinates.empty?
       user = create_guest_user
       location = (current_user ? current_user.address : user.address)
       @local_articles = Article.near(location, 20)
       @articles = Article.all
     else
       @articles = Article.all
     end
  end

  def get_location
    user = create_guest_user
    current_user ? current_user.address : user.address
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
      update_user_location
      set_edition
      @geocoded = true
    else
      @geocoded = false
    end
  end

  def update_user_location
    if current_user
      current_user.latitude = @coordinates.values.first
      current_user.longitude = @coordinates.values.second
      current_user.save
    end
  end

end
