class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    @current_user ||= User.find_by(user_token: request.env["HTTP_X_API_KEY"])
  end
end
