class Article < ApplicationRecord
  validates :title, :content, :author, presence: true

  belongs_to :author
end
