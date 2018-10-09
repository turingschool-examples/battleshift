class UserPresenter
  attr_reader :filter

  def initialize(filter = {})
    @filter = filter
  end

  def single_user_object
    UserDisplay.new(user_service.single_user_data)
  end

  private

  def user_service
    UserService.new(filter)
  end
end
