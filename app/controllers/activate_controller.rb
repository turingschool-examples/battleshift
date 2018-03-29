class ActivateController < ApplicationController
  def show
    @user = User.find(params[:id])
    @user.active!
    session[:user_id] = @user.id
  end
end
