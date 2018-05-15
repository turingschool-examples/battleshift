require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe "Registration email" do
    it "includes activation link" do
      user = create(:user)
      email = UserMailer.registration_email(user)

      expect(email.subject).to eq('Activate your Battleshift account')
      expect(email.to).to eq(["#{user.email}"])
      expect(email.from).to eq(['from@example.com'])
      expect(email.body).to include("http://localhost:3000/users/#{user.id}/activate")
      expect(email.body).to include(user.api_key)
    end
  end
end
