require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'DB columns' do
    it { is_expected.to have_db_column :email }
    it { is_expected.to have_db_column :content }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :content }
  end

  describe "Factory" do
    it "should have a valid factory" do
      article = FactoryBot.create(:article)
      expect(FactoryBot.create(:comment, article: article)).to be_valid
    end
  end
end
