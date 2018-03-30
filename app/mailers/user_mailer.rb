class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def welcome_email(user)
    @user = user
    @url = 'https://command-battleshift.herokuapp.com/'
    mail(to: @user.email, subject: 'Welcome to Command Battleshift!')
  end
end
