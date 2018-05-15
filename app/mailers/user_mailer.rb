class UserMailer < ApplicationMailer
  def create_activation
    @user = params[:user]
    @url = ENV['APPLICATION_URL']
    mail(to: @user.email, subject: 'Activate your account')
  end
end
