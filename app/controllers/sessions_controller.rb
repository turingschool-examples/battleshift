class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
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
