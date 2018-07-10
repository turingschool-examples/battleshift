class RegistrationMailer < ApplicationMailer

  def activate(user)
    @api_key = user.api_key
    mail(to: user.email, subject: "Welcome to Battleshift!")
  end

end
