class Comment < ApplicationRecord
  validates_presence_of :content, :email

  belongs_to :article
end
