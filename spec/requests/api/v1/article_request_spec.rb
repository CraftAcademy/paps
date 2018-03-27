require 'rails_helper'

RSpec.describe Api::V1::ArticlesController, type: :request do

  describe 'GET /v1/articles.json' do
    it 'should return articles' do
      get '/api/v1/articles.json'

      expect(response.status).to eq 200
      #response.should render_template(:index)
    end
  end
end
