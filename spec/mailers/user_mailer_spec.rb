require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe 'Activation Email' do
    let(:user) { create(:user) }
    let(:email) { UserMailer.with(user: user).activation_email }

    it 'should send an activation email' do
      link = "#{ENV['base_url']}/activate/#{user.activation_key}"
      expect(email.body.encoded).to have_link('Visit here to activate your account.', href: link)
    end
  end
end
