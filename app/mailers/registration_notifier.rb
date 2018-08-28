class RegistrationNotifier < ApplicationMailer
  include Rails.application.routes.url_helpers
  def confirmation(user)
    @user = user
    mail(to: user.email, subject: "BattleShift Registration")
  end
end
