class HomeController < ApplicationController
  before_action :get_coordinates, only: [:index]

  def index
    @articles = Article.all
  end

  def current_user
     super || guest_user
  end

  def set_edition
    if User.near([57.7,11.9], 100).include? current_user
      @edition = 'Gothenburg Edition'
    else
      @edition = 'Rest of Sweden Edition'
    end
  end

  def get_coordinates
    binding.pry
    @coordinates = {}
    if cookies['geocoderLocation'].present?
      @coordinates = JSON.parse(cookies['geocoderLocation']).to_hash_symbolize_keys
      set_edition
      @geocoded = true
    else
      @geocoded = false
    end
  end

end
