require 'rails_helper'

RSpec.describe Article, type: :model do
  describe 'DB columns' do
    it { is_expected.to have_db_column :title }
    it { is_expected.to have_db_column :content }
  end

  describe 'Factory' do
    it 'should have valid Factory' do
      expect(FactoryBot.create(:article)).to be_valid
    end
  end
end
