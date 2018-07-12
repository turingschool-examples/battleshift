class BattleshipNotifierMailer < ApplicationMailer
  def welcome(user, base_url)
    @user = user
    @url = base_url
    mail(to: user.username, subject: "#{user.first_name}, welcome to Battleshift.")
  end

  def register(email)
    mail(to: email, subject: "Please create an account to play a game.")
  end 
end
