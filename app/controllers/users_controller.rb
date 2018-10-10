class UsersController < ApplicationController
  
  def show
    @user = UserLogic.new(params).expected_user
  end
  
  def index
    @users = UserLogic.new.expected_users
  end
  
end