RSpec.describe User, type: :model do
  describe 'db table' do
    it {is_expected.to have_db_column :email}
    it {is_expected.to have_db_column :encrypted_password}
    it { is_expected.to have_db_column :longitude }
    it { is_expected.to have_db_column :latitude }
    it { is_expected.to have_db_column :address }
    it { is_expected.to have_db_column :uid }
    it { is_expected.to have_db_column :confirmation_token }
    it { is_expected.to have_db_column :tokens }
    it { is_expected.to have_db_column :confirmation_token}
    it { is_expected.to have_db_column :confirmed_at}
    it { is_expected.to have_db_column :confirmation_sent_at}
  end

  describe "Factory" do
    it "should have a valid factory" do
      expect(create(:user)).to be_valid
    end
  end
end
