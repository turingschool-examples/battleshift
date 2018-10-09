class UserPresenter

  def user_service(id)
    UserService.new(id)
  end

  def user_object(id)
    UserDisplay.new(user_service(id).user_data)
  end

end
