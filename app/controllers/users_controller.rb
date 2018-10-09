class UsersController < ApplicationController

  def show
    @user_facade = UserFacade.new(params[:id])
  end

end
