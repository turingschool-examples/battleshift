module SessionsHelper
  def login(user)
    session[:user_id] = user.id
    flash[:success] = "Logged in as #{user.name}"
    redirect_to dashboard_path
  end

  def logout
    session[:user_id] = nil
    redirect_to login_path
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end

end
