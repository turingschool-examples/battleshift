class UsersController < ApplicationController

  def show
    @search_result = UserPresenter.new.user_object(params[:id])
  end
end
