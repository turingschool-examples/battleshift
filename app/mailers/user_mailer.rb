class UserMailer < ApplicationMailer
  default from: 'donotreply@battleshift.com'

  def activation_invite(user)
    @user = user
    @url = "#{ENV['root']}/activate/#{@user.id}"
    mail(to: @user.email, subject: 'Activate your BattleShift account')
  end

  def game_invite(email)
    mail(to: email, subject: "You have been invited to a game of BattleShift!")
  end
end
