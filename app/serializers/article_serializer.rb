class ArticleSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :title, :content, :comments, :link
  has_many :comments

  def link
    Rails.application.routes.url_helpers.api_v1_article_path(object)
  end

  def comments
    object.comments.each do |comment|
      CommentSerializer.new(comment).as_json
    end
  end

end
