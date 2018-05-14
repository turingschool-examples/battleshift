class UserActivatorMailer < ApplicationMailer
  def welcome_email(user)
    @user = user
    mail(to: user.email, subject: "Welcome to BattleShift, #{@user.name}")
  end
end
