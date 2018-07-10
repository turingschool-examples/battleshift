require "rails_helper"

RSpec.describe BattleshipNotifierMailer, type: :mailer do
  describe 'user recieves email with appropriate subject, body, and link' do
    let(:user){mock_model User, first_name: 'John', last_name: 'Livingston', email: 'jliv316@gmail.com'}
    let(:mail){BattleshipNotifierMailer.welcome(user)}

    it 'renders the subject' do
      expect(mail.subject).to eq("#{user.first_name}, welcome to Battleshift.")
    end

    it 'renders the reciever email' do
      expect(mail.to).to eq([user.email])
    end

    it 'renders the senders email' do
      expect(mail.from).to eq(['no-reply@battleshift.com'])
    end

    it 'assigns confirmation_url' do
      expect(mail.body.encoded).to match("http://localhost:3000/activate/user")
    end
  end
end
