class User < ApplicationRecord
  after_validation :reverse_geocode  # auto-fetch address
  reverse_geocoded_by :latitude, :longitude

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :articles
end
