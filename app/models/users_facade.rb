class UsersFacade
  attr_reader :name, :email


  def users
      # this returns the parsed response (hash)

    @users ||= service.users_search.map do |data|
      User.new(data)
    end
  end

    private

      def service
        UserService.new
      end



end
