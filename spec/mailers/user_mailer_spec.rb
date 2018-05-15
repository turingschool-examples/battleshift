require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe "Registration email" do
    it "includes activation link" do
      user = create(:user)
      email = UserMailer.registration_email(user)

      text_body = File.read('spec/fixtures/user_mailer/activation.txt')
      html_body = File.read('spec/fixtures/user_mailer/activation.html')

      expect(email.subject).to eq('Activate your Battleshift account')
      expect(email.to).to eq(["#{user.email}"])
      expect(email.from).to eq(['welcome@battleshift.com'])
      expect(email.body.raw_source).to include("/activation")
      expect(email.body.raw_source).to include(user.api_key)
    end
  end
end
