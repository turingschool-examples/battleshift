class UserMailer < ApplicationMailer
  def activation_email
    @user = params[:user]
    @url = "#{ENV['base_url']}/activate/#{@user.activation_key}"
    @api_key = @user.api_key
    
    mail(to: @user.email, subject: 'Activate Your Battleshift Account')
  end
end
