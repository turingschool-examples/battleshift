class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.create(user_params)
    user.api_key = create_api_key
    user_token = UserToken.create(user_id: user.id, token: create_api_key)
    UserMailer.account_activate(user, user_token.token).deliver
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
