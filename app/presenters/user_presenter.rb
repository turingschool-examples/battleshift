class UserPresenter

  def single_user_object(filter)
    UserDisplay.new(user_service(filter).single_user_data)
  end

  private

  def user_service(filter)
    UserService.new(filter)
  end
end
