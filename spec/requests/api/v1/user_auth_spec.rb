require 'rails_helper'

RSpec.describe Api::V1::ArticlesController, type: :request do
  let!(:article) {create(:article)}
  let!(:comment) {create(:comment, article: article)}
  describe 'none auth user tries to access get /api/v1/artiles' do
    let(:document) { JSON.parse(response.body) }
    before do
      get "/api/v1/articles/#{article.id}"
    end

    it 'should return error message if user is not logged in' do
      expect(document['errors'].first).to eq 'You need to sign in or sign up before continuing.'
    end
  end

  describe 'user signs in with /api/v1/auth/sign_in' do
    let(:document) { JSON.parse(response.body) }
    let(:user) { create(:user) }
    let(:credentials) { user.create_new_auth_token }
    let(:headers) { { HTTP_ACCEPT: 'application/json' }.merge!(credentials) }

    it 'valid user returns user data' do
      post '/api/v1/auth/sign_in', params: {
        email: user.email, password: user.password,
      }, headers: headers

      expected_response = eval(file_fixture('user.txt').read)

      expect(document).to eq expected_response
    end

  end
end
