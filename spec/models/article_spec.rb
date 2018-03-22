require 'rails_helper'

RSpec.describe Article, type: :model do
  describe 'DB columns' do
    it { is_expected.to have_db_column :title }
    it { is_expected.to have_db_column :content }
    it { is_expected.to have_db_column :longitude }
    it { is_expected.to have_db_column :latitude }
    it { is_expected.to have_db_column :address }
  end

  describe 'Factory' do
    it 'should have valid Factory' do
      expect(create(:article)).to be_valid
    end
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :title }
    it { is_expected.to validate_presence_of :content }
  end
end
