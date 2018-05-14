module Users
  class ActivationController < ApplicationController
    def edit
      @user = User.find_by_id(params[:id])
    end

    def update
      user = User.find_by_id(params[:id])
      user.activate
      redirect_to user
    end
  end
end
