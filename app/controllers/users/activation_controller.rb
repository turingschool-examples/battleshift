module Users
  class ActivationController < ApplicationController
    def update
      user = User.find_and_activate(params[:key])
      login(user)
    end
  end
end
