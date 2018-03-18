class Article < ApplicationRecord
  validates :title, :content, :author, presence: true
end
