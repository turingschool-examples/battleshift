class UsersController < ApplicationController

  def show
    user_service = UserService.new
    @user = user_service.find_user(params["id"])
  end

  def index
    user_service = UserService.new
    @users = user_service.all_users
  end
end