require 'rails_helper'

RSpec.describe Api::V1::ArticlesController, type: :request do
  let!(:article) {create(:article)}
  let!(:comment) {create(:comment, article: article)}
  describe 'none auth user tries to access get /api/v1/artiles/id' do
    let(:document) { JSON.parse(response.body) }
    before do
      get "/api/v1/articles/#{article.id}"
    end

    it 'should return error message if user is not logged in' do
      expect(document['errors'].first).to eq 'You need to sign in or sign up before continuing.'
    end
  end

  describe 'user signs in with successfully' do
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

  describe 'users types in the wrong credentials' do
    let(:document) { JSON.parse(response.body) }
    let(:user) { create(:user) }
    let(:headers) { { HTTP_ACCEPT: 'application/json' } }


    it 'should return error if wrong password' do

      post '/api/v1/auth/sign_in', params: {
        email: user.email, password: 'wrongPassword',
      }, headers: headers

      expect(document['errors'].first).to eq 'Invalid login credentials. Please try again.'
    end

    it 'should return error if wrong email' do

      post '/api/v1/auth/sign_in', params: {
        email: 'wrong@email.com', password: user.password,
      }, headers: headers

      expect(document['errors'].first).to eq 'Invalid login credentials. Please try again.'
    end
  end
end
