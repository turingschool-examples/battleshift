require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe 'Activation' do
    it 'can send activation email' do
      user = create(:user)
      email = UserMailer.with(user: user).create_activation.deliver_now

      expect(email.to).to eq([user.email])
      expect(email.from).to eq([ENV['default_from']])
      expect(email.subject).to eq('Activate your account')
      # expect(email.body.to_s).to eq('Activate your account')
   end
 end
end
