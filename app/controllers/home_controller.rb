class HomeController < ApplicationController
  before_action :get_coordinates, only: [:index]

  def index
       if cookies['geocoderLocation'].present? && Article.near(current_user.address, 20) != nil
         @articles = Article.near(current_user.address, 20)
       else
         @articles = Article.all
       end

  end

  def current_user
     super || create_guest_user
  end

  def set_edition
    if User.near([57.7,11.9], 100).include? current_user
      @edition = 'Gothenburg Edition'
    else
      @edition = 'Rest of Sweden Edition'
    end
  end

  def get_coordinates
    @coordinates = {}
    if cookies['geocoderLocation'].present?
      @coordinates = JSON.parse(cookies['geocoderLocation']).to_hash.symbolize_keys
      set_edition
      update_current_user_location
      @geocoded = true
    else
      @geocoded = false
    end
  end

  def create_guest_user
    token = SecureRandom.base64(15)
    user = User.new({password: token, email: "#{token}@example.com"}.merge!(@coordinates))
    user.save(validate: false)
    user
  end

  def update_current_user_location
    current_user.latitude = @coordinates.values.first
    current_user.longitude = @coordinates.values.second
    current_user.save
  end

end
