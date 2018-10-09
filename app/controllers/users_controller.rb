class UsersController < ApplicationController
  
  def show
    @user = FindUser.new(params[:id])
  end
  
  def index
    @users = FindUser.new
  end
end