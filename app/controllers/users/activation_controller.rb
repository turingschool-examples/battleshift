module Users
  class ActivationController < ApplicationController
    def edit
      @user = User.find_by_id(params[:id])
    end

    def update
      user = User.find_by_id(params[:id])
      user.activate
      session[:id] = user.id
      redirect_to users_activated_path(user) 
    end

    def show
      @user = User.find_by_id(params[:id])
    end
  end
end
