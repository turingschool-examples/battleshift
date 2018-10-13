require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe "activation" do

    it "renders the headers" do
      user = create(:user)
      mail = UserMailer.activation(user)
      expect(mail.subject).to eq("Activate Your Account")
      expect(mail.to).to eq(["jbartlet@example.com"])
      expect(mail.from).to eq(["no-reply@spam.com"])
    end

    it "renders the body" do
      user = create(:user)
      mail = UserMailer.activation(user)
      expect(mail.body.encoded).to have_content("Visit here to activate your account.")
      expect(mail.body.encoded).to have_content("API KEY: ")
    end
  end
end
