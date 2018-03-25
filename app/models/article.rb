class Article < ApplicationRecord
  after_validation :reverse_geocode  # auto-fetch address
  reverse_geocoded_by :latitude, :longitude

  validates :title, :content, :categories, presence: true
  has_many :comments, dependent: :destroy
  has_and_belongs_to_many :categories
end
