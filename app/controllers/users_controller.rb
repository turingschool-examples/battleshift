class UsersController < ApplicationController

  def index
    @search_result = UserPresenter.new
  end

  def show
    @search_result = UserPresenter.new({id: params[:id]}).single_user_object
  end
end
