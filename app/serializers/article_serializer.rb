class ArticleSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :title, :content, :comments
  has_many :comments

  def comments

  
  end
end
