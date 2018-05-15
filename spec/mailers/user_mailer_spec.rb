require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe "Registration email" do
    it "includes activation link" do
      user = create(:user)
      email = UserMailer.registration_email(user)

      binding.pry
      expect(email.subject).to eq('Activate your Battleshift account')
      expect(email.to).to eq(["#{user.email}"])
      expect(email.from).to eq(['from@example.com'])
      expect(email.body.encoded).to include("http://localhost:3000/activate/#{user.activation_key}")
      expect(email.body.encoded).to include(user.api_key.id)
    end
  end
end
