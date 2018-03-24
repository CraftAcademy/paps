class Article < ApplicationRecord
  after_validation :reverse_geocode  # auto-fetch address
  reverse_geocoded_by :latitude, :longitude
  
  validates :title, :content, presence: true

  belongs_to :user, optional: true
  has_many :comments, dependent: :destroy
end
