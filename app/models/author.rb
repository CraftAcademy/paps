class Author < ApplicationRecord
  validates :author, presence: true

  has_many :articles
end
