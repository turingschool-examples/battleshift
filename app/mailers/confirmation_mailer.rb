class ConfirmationMailer < ApplicationMailer
  def confirmation(user)
    @user = user
    mail(to: @user.email, subject: "Confirmation Email")
  end
end
