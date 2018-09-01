class AccountActivationMailer < ApplicationMailer
  def activation_token(user)
    @user = user
    mail(to: user.email, subject: "Battleshift Verification")
  end
end
