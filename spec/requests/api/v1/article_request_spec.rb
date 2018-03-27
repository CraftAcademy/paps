require 'rails_helper'

RSpec.describe Api::V1::ArticlesController, type: :request do
  let!(:article) {create(:article)}

  describe 'GET /v1/articles' do
    let(:document) { JSON.parse(response.body) }
    let(:object) { document['data'].first }
    before do
      get '/api/v1/articles'
    end

    it 'is of type "articles"' do
      expect(object).to have_type 'articles'
    end

    it 'has comments' do
      expect(object).to have_attribute 'comments'
    end

    it 'has a link' do
      expect(object).to have_attribute(:link).with_value("/api/v1/articles/#{article.id}")
    end

    %w(title content).each do |attr|
      it "has #{attr} attribute" do
        expect(object).to have_attribute attr.to_sym
      end
    end

  end
end
