class UserMailer < ApplicationMailer
  def registration_email
    @user = params[:user]
    mail(to: @user.email, subject: 'Welcome to Battleshift!')
  end
end
