class UserMailer < ApplicationMailer
  def registration_email(user)
    @user = user
    @url = "#{ENV['BASE_URL']}/activation"
    @api_key = @user.api_key
    mail(to: @user.email, subject: "Activate your Battleshift account")
  end
end
