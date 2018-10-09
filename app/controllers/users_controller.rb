class UsersController < ApplicationController

  def show
    @search_result = UserPresenter.new({id: params[:id]}).single_user_object
  end
end
