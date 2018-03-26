require 'rails_helper'

RSpec.describe Api::V0::PingsController, type: :request do
  let(:article) {create(:article)}
  describe 'GET /v1/articles' do
    it 'should return article' do
      get '/api/v1/articles'
      json_response = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(json_response['data']).to eq article
    end
  end
end
