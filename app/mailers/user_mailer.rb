class UserMailer < ApplicationMailer
  default from: 'donotreply@battlshift.com'

  def activation_invite(user)
    @user = user
    @url = activation_path(@user)
    mail(to: @user.email, subject: 'Activate your BattleShift account')
  end
end
