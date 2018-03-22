class Article < ApplicationRecord
  validates :title, :content, presence: true
  has_many :comments, dependent: :destroy
  has_and_belongs_to_many :categories
end
