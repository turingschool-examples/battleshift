require "rails_helper"

RSpec.describe RegistrationNotifier, type: :mailer do
  describe 'instructions' do
    # TODO: try factory bot if this works
    before :each do
      @user = create(:user)
    end

    let(:mail) { RegistrationNotifier.confirmation(@user).deliver_now }

    it 'renders the subject' do
      expect(mail.subject).to eq('BattleShift Registration')
    end

    it 'renders the receiver email' do
      expect(mail.to).to eq([@user.email])
    end

    it 'renders the sender email' do
      expect(mail.from).to eq(['noreply@battleshift.com'])
    end

    it 'assigns @name' do
      expect(mail.body.encoded).to match(@user.name)
    end

    it 'assigns @auth_token' do
      expect(mail.body.encoded).to match(@user.auth_token)
    end
  end
end
