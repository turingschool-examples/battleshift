class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    @current_user = User.find_by(id: session[:id])
  end

  def default_url_options
    if Rails.env.production?
      {:host => "https://infinite-fjord-32357.herokuapp.com"}
    else
      {}
    end
  end
end
