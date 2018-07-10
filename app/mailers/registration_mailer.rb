class RegistrationMailer < ApplicationMailer

  def activate(user)
    @api_key = user.api_key
    if ENV["RAILS_ENV"] == 'production'
      @url = 'http://battle-shift-noobs.herokuapp.com'
    else
      @url = 'localhost:3000'
    end 
    mail(to: user.email, subject: "Welcome to Battleshift!")
  end

end
