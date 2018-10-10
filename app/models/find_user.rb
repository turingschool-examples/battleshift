class FindUser
  
  def initialize(filter = {})
    @filter = filter
  end
  
  def expected_user 
    data = service.get_user
    ResultUser.new(data)
  end
  
  def expected_users 
    data = service.get_users
    data.map do |raw_user|
      ResultUser.new(raw_user)
    end
  end
  
  private 
    def service
      UserService.new(@filter)
    end
end 