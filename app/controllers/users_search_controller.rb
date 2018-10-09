class UsersSearchController < ApplicationController
  
  def show
    @user_result = UserSearchResult.new(params[:id])
  end
end