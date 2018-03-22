require 'rails_helper'

RSpec.describe AdminUser, type: :model do
  describe 'db table' do
    it {is_expected.to have_db_column :email}
    it {is_expected.to have_db_column :encrypted_password}
  end

  describe "Factory" do
    it "should have a valid factory" do
      expect(create(:admin_user)).to be_valid
    end
  end
end
