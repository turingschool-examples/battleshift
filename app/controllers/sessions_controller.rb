class SessionsController < ApplicationController

  def new
  end

  def create
    if user = User.find_by(email: params[:email])
      session[:user_id] = user.id
      flash[:notice] = "Welcome #{user.name}!"
      redirect_to dashboard_path
    else
      flash[:error] = "Miss! Invalid Credentials"
      redirect_to login_path
    end
  end

end
