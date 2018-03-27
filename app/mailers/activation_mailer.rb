class ActivationMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def activation_email(user)
    @user = user
    @url = 'https://command-battleshift.herokuapp.com/activate'
    mail(to: @user.email, subject: 'Welcome! Please complete registration') do |format|
      format.text
      format.html
    end 
  end
end
