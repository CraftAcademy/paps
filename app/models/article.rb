class Article < ApplicationRecord
  after_validation :reverse_geocode  # auto-fetch address
  reverse_geocoded_by :latitude, :longitude
  
  validates :title, :content, presence: true
  has_many :comments, dependent: :destroy
end
