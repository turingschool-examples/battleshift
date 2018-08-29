class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.create(user_params)
    binding.pry
    token = SecureRandom.urlsafe_base64.to_s
    user_token = UserToken.create(user_id: user.id, token: token)
    UserMailer.account_activate(user, token).deliver
    redirect_to dashboard_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def create_api_key
    SecureRandom.urlsafe_base64.to_s
  end

end
