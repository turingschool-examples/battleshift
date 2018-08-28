class Api::V1::ConfirmationController < ApplicationController
  def update
    @user = User.find(params[:user_id])
    session[:id] = @user.id

    @user.confirm_registration

    redirect_to api_v1_user_confirmed_path(@user)
  end

  def show
    @user = User.find(params[:user_id])
  end
end
