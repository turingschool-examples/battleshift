class UserMailer < ApplicationMailer
  default from: ENV['SENDGRID_USERNAME']

  def activation_request(user)
    @user = user
    mail to: @user.email, subject: 'BattleShift Registration Confirmation'
  end
end
