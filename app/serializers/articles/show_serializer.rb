class Articles::ShowSerializer < ActiveModel::Serializer
  attributes :title, :content
  has_many :comments

  def comments
    object.comments.each do |comment|
      CommentSerializer.new(comment).as_json
    end
  end

end
