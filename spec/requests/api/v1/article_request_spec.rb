require 'rails_helper'

RSpec.describe Api::V1::ArticlesController, type: :request do
  let!(:article) { create(:article) }
  let!(:comment) { create(:comment, article: article) }
  let!(:user) { create(:user, subscriber: true) }
  describe 'GET /v1/articles' do
    let(:document) { JSON.parse(response.body) }
    let(:object) { document['data'].first }
    before do
      sign_in(user)
      get '/api/v1/articles'
    end

    it 'is of type articles' do
      expect(object).to have_type 'articles'
    end

    it 'has a title' do
      expect(object).to have_attribute(:title)
    end

    it 'has a link' do
      expect(object).to have_attribute(:link).with_value("/api/v1/articles/#{article.id}")
    end

  end

  describe 'GET /v1/articles/id' do
    let(:document) { JSON.parse(response.body) }
    let(:object) { document['data'] }
    before do
      sign_in(user)
      get "/api/v1/articles/#{article.id}"
    end

    it 'is of type articles' do
      expect(object).to have_type 'articles'
    end

    it 'has relationship' do
      expect(object).to have_relationship(:comments)
    end

    %w(title content).each do |attr|
      it "has #{attr} attribute" do
        expect(object).to have_attribute attr.to_sym
      end
    end
  end
end
