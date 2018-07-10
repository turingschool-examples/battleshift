class SessionsController < ApplicationController

  def new
  end

  def create
    require 'pry'; binding.pry
    @user = User.find_by(username: params[:session][:email])
    session[:id] = @user.id
    redirect_to "/dashboard/#{@user.id}", notice: 'User was successfully logged in.'
  end
end