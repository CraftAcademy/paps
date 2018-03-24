require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'db table' do
    it {is_expected.to have_db_column :email}
    it {is_expected.to have_db_column :encrypted_password}
    it { is_expected.to have_db_column :longitude }
    it { is_expected.to have_db_column :latitude }
    it { is_expected.to have_db_column :address }
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
