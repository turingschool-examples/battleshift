class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find(params[:session][:id])
    if user && user.authenticate(params[:session][:password])
      login(user)
    else
      flash.now[:danger] = 'Invalid credentials'
      render :new
    end
  end

  def destroy
    logout
  end
end
