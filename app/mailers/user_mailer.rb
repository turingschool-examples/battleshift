class UserMailer < ApplicationMailer
  def registration_email(user)
    @user = user
    @url = "http://localhost:3000/users/#{@user.id}/activate"
    mail(to: @user.email, subject: "Activate your Battleshift account")
  end
end
