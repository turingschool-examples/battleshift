class ActivateController < ApplicationController
  def index
    user = User.find_by(api_token: params[:token])
    if user.active
      flash[:activated] = "This account has already been activated. Please log in."
      redirect_to login_path
    else
      user.update_attribute(:active, true)
      session[:user_id] = user.id
    end
  end
end
