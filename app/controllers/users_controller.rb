class UsersController < ApplicationController

  def show
    @user_facade = UserFacade.new(params[:id])
  end

  def index
    @users_facade = UsersFacade.new
  end

end
