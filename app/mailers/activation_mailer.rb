class ActivationMailer < ApplicationMailer
  default from: 'registration@battleshift.com'

  def activation_email(user)
    @user = user
    @url = activate_url
    mail(to: @user.email, subject: 'Welcome! Please complete registration') do |format|
      format.text
      format.html
    end
  end
end
