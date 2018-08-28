class RegistrationNotifier < ApplicationMailer
  def confirmation(user)
    @user = user
    mail(to: user.email, subject: "BattleShift Registration")
  end
end
