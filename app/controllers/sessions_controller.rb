class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(username: params[:session][:email])
    session[:id] = @user.id
    redirect_to "/dashboard/#{@user.id}", notice: 'User was successfully logged in.'
  end

  def destroy
    logout
    redirect_to root_path
  end
end