class UserMailer < ApplicationMailer
  def create_activation
    @user = params[:user]
    @url = ENV['application_url']
    mail(to: @user.email, subject: 'Activate your account')
  end
end
