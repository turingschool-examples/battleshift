class BattleshipNotifierMailer < ApplicationMailer
  def welcome(user)
    @user = user
    mail(to: user.email, subject: "#{user.name}, welcome to Battleshift.")
  end
end
