class RegistrationMailer < ApplicationMailer
  default from: 'admin@battleshift.com'

  def activate(user)
    @user = user

    mail to: @user.email, subject: 'Activate Account'
  end
end
