require 'rails_helper'

RSpec.describe Author, type: :model do
  describe 'Associations' do
    it { should have_many :articles}
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :author }
  end

  describe 'Factory' do
    it 'should have valid Factory' do
      expect(create(:author)).to be_valid
    end
  end
end
