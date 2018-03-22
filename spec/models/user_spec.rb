require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'db table' do
    it {is_expected.to have_db_column :email}
    it {is_expected.to have_db_column :encrypted_password}
  end

  describe "Factory" do
    it "should have a valid factory" do
      expect(create(:user)).to be_valid
    end
  end

  describe 'Associations' do
    it { is_expected.to have_many :articles }
  end
end
