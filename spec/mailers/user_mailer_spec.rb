require "rails_helper"

describe UserMailer, type: :mailer do
  context "as a non-activated user" do
    it "invites new user to activate their account with registration email" do
      user = create(:user)
      email = UserMailer.activation_invite(user)

      email.deliver_now

      expect(email.from).to eq(['donotreply@battleshift.com'])
      expect(email.to).to eq([user.email])
      expect(email.subject).to eq('Activate your BattleShift account')
      expect(email.body.encoded).to include("Thanks for signing up #{user.name}!")
      expect(email.body.encoded).to include("Click here to activate your account")
    end
  end
end
