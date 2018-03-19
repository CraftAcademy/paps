class Article < ApplicationRecord
  validates :title, :content, presence: true

  belongs_to :user, optional: true

  has_many :comments
end
