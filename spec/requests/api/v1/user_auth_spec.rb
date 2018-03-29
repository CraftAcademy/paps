RSpec.describe Api::V1::ArticlesController, type: :request do

  let!(:article) {create(:article)}
  let!(:comment) {create(:comment, article: article)}
  let!(:user) {create(:user, subscriber: true)}

  describe 'not auth user tries to access get /api/v1/artiles/id' do

    let(:object) { JSON.parse(response.body) }

    before do
      get "/api/v1/articles/#{article.id}"
    end

    it 'should return error message if user is not logged in' do
      expect(object['errors'].first).to eq 'You need to sign in or sign up before continuing.'
    end
  end

  describe 'auth user tries to access get /api/v1/artiles/id' do

    let(:object) { JSON.parse(response.body) }
    let(:credentials) { user.create_new_auth_token }
    let(:headers) { { HTTP_ACCEPT: 'application/json' }.merge!(credentials) }

    before do
      get "/api/v1/articles/#{article.id}", headers: headers
    end

    it 'should return the article' do
      expected_response = eval(file_fixture('article.txt').read)
      expect(object).to eq expected_response
    end
  end
end
