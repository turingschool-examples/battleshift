#In User

def Create
  user = User.new(user_params)
  token = SecureRandom.urlsafe_base64.to_s
  user_token = UserToken.create(user_id: user.id, token: token)
  UserMailer.account_activate(user).deliver
end

# In Sessions
Show
  if user_token = UserToken.find_by(user_token_params)
    user = User.find(user_token.user_id)
    user.status = 'active'
    user_token.destroy
    session[:user_id] = user.id
    redirect_to dashboard_path
  else
    #error message
  end
end
