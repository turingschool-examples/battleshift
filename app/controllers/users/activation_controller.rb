module Users
  class ActivationController < ApplicationController
    def edit
      @user = User.find(params[:id])
    end

    def update
      user = User.find_and_activate(params[:id])
      session[:id] = user.id
      redirect_to users_activated_path(user) 
    end

    def show
      @user = User.find(params[:id])
    end
  end
end
