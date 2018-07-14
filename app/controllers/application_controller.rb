class ApplicationController < ActionController::Base
  helper_method :current_user, :login, :logout

  def login(user)
    session[:id] = user.id
  end

  def logout
    session[:id] = nil
    @user = nil
  end

  def current_user
    @user ||= User.find_by(id: session[:id])
  end
end
