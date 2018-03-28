class ArticleSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :title, :link

  def link
    Rails.application.routes.url_helpers.api_v1_article_path(object)
  end

end
