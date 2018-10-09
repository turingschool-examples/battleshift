class UsersController < ApplicationController

  def index
  end

  def show
    @search_result = UserPresenter.new({id: params[:id]}).single_user_object
  end
end
