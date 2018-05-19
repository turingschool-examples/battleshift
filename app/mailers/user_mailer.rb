class UserMailer < ApplicationMailer
  def registration_email(user)
    @user = user
    @url = "#{ENV['BASE_URL']}/users/activation?key=#{@user.api_key}"
    @api_key = @user.api_key
    mail(to: @user.email, subject: "Activate your Battleshift account")
  end
end
