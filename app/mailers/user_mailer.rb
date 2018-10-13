class UserMailer < ApplicationMailer
  default from: 'no-reply@spam.com'

  def activation(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: user.email, subject: 'Activate Your Account')
  end
end
