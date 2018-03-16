require 'rails_helper'

RSpec.describe ApplicationMailer, type: :mailer do

  let(:user) { create(:user, email: 'david@cc.com' )}
  let(:message) { described_class.test_email(user).deliver_now}

  it 'assigns from field' do
    expect(message.from).to eq ['obama@whitehouse.gov']
  end

  it 'assigns to field' do
    expect(message.to).to eq ['david@cc.com']
  end

  it 'assigns subject' do
    expect(message.subject).to eq 'Welcome to PAPs'
  end
end
