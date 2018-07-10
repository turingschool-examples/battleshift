require "rails_helper"

RSpec.describe BattleshipNotifierMailer, type: :mailer do
  describe 'user recieves email with appropriate subject, body, and link' do
    let(:user){ create(:user) }
    let(:mail){BattleshipNotifierMailer.welcome(user)}

    it 'renders the subject' do
      expect(mail.subject).to eq("#{user.first_name}, welcome to Battleshift.")
    end

    it 'renders the reciever email' do
      expect(mail.to).to eq([user.username])
    end

    it 'renders the senders email' do
      expect(mail.from).to eq(['no-reply@battleshift.com'])
    end

    it 'assigns confirmation_url' do
      expect(mail.body.encoded).to match("http://localhost:3000/activate/user")
    end
  end
end
