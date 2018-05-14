class UserActivatorMailer < ApplicationMailer
  def welcome_email(user)
    @user = user
    mail(to: user, subject: "Welcome to BattleShift, #{@user.name}")
  end
end
