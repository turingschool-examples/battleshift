class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    if session[:user_token]
      @current_user ||= User.find_by(user_token: session[:user_token])
    end
  end
end
