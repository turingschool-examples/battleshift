class UsersController < ApplicationController

  def show
    @user_facade = UserFacade.new(params[:id])
  end

  def index
    @users_facade = UsersFacade.new
  end

  def edit
    @user_id = params[:id]
  end

  def update
    hash = {email: params[:email]}
    service = UserService.new(params[:id])
    service.user_patch(hash.to_json)
    flash[:notice] = "Successfully updated "
    redirect_to "/users"
  end

end
