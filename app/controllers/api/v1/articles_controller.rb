class Api::V1::ArticlesController < ApiController
  before_action :authenticate_api_v1_user!

  def index
    articles = Article.all
    render json: articles, status: :ok
  end

  def show
    article = Article.find_by(id: params[:id])
    render json: article, serializer: Articles::ShowSerializer, status: :ok
  end
end
