class UserMailer < ApplicationMailer
  default from: 'donotreply@battlshift.com'

  def activation_invite(user)
    @user = user
    mail(to: @user.email, subject: 'Activate your BattleShift account')
  end
end
