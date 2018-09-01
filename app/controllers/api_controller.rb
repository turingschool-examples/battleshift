class ApiController < ActionController::API

  def current_user
    if request.env["HTTP_X_API_KEY"]
      @current_user ||= User.find_by(user_token: request.env["HTTP_X_API_KEY"])
    end
  end

  def your_turn?
    
  end
end
