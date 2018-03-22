require 'rails_helper'

RSpec.describe Category, type: :model do
  describe "Factory" do
    it "should have a valid factory" do
      article = create(:category)
      expect(create(:category)).to be_valid
    end
  end

  describe "Assosiation" do
    it {is_expected.to have_and_belong_to_many :articles}
  end

  describe 'DB columns' do
    it { is_expected.to have_db_column :name }
  end
end
