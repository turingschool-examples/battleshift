 class RegisterPresenter 
    extend Forwardable
    attr_reader :api_key,:url

    def initialize(user)
      @api_key = user.api_key
        if ENV["RAILS_ENV"] == 'production'
          @url = 'http://battle-shift-noobs.herokuapp.com'
        else
          @url = 'localhost:3000'
        end 
    end

 end