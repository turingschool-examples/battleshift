class ActivationMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def activation_email(user)
    @user = user
    @url = activate_url(activation_key: @user.activation_key.activation_key)
    mail(to: @user.email, subject: 'Welcome! Please complete registration') do |format|
      format.text
      format.html
    end
  end
end
