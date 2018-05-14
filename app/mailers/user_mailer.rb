class UserMailer < ApplicationMailer
  def activation_email
    @user = params[:user]
    @url = "#{ENV['base_url']}/activate/#{@user.activation_code}"

    mail(to: @user.email, subject: 'Activate Your Battleshift Account')
  end
end
