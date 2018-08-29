class UserActivationMailer < ApplicationMailer
  include Rails.application.routes.url_helpers
  
  def user_activation(user)
    @user = user
    mail(to: @user.email, subject: "Battleshift Activation.")
  end
end
