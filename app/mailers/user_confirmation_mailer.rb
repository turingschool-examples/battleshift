class UserConfirmationMailer < ApplicationMailer
  default :from => 'address@example.com'

  def confirmation_email(user)
    @user = user
    mail( :to => @user.email, :subject => 'Activate your account')
  end

end
