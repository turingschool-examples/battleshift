class RegistrationMailer < ApplicationMailer
  def activate(user)
    @register_presenter = RegisterPresenter.new(user)
    mail(to: user.email, subject: "Welcome to Battleshift!")
  end
end
