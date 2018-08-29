class ApiController < ActionController::API

  def authenticate
    api_key = request.headers['X-API-KEY']
    @user = User.where(auth_token: api_key).first if api_key
    unless @user
      head status: :unauthorized
      return false
    end
  end
end
