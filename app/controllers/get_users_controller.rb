class GetUsersController < ApplicationController
  
  def show
    @user = GetUser.expected_user(params[:id])
  end
end