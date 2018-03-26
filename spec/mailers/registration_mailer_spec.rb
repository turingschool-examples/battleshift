require "rails_helper"

RSpec.describe RegistrationMailer, type: :mailer do
  describe "activate" do
    let(:user) { create(:user) }
    let(:mail) { RegistrationMailer.activate(user) }

    it 'queues the email' do
      expect { mail.deliver_now }.to change { ActionMailer::Base.deliveries.count }.by(1)
    end

    it "renders the headers" do
      expect(mail.subject).to eq("Activate Account")
      expect(mail.to).to eq([user.email])
      expect(mail.from).to eq(["admin@battleshift.com"])
    end

    it "renders the body" do
      text_body = File.read('spec/fixtures/registration_mailer/activate.txt')
      html_body = File.read('spec/fixtures/registration_mailer/activate.html')
      expect(mail.text_part.body.to_s).to match(text_body)
      expect(mail.html_part.body.to_s).to match(html_body)
    end
  end

end
