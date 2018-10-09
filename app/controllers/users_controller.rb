class UsersController < ApplicationController

  def show
    @search_result = UserPresenter.new.user_object({id: params[:id]})
  end
end
