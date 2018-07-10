class BattleshipNotifierMailer < ApplicationMailer
  def welcome(user)
    @user = user
    mail(to: user.username, subject: "#{user.first_name}, welcome to Battleshift.")
  end
end
