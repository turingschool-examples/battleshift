class ConfirmationController < ApplicationController
  def create
    ConfirmationMailer.confirmation(current_user).deliver_now
    redirect_to dashboard_path
  end

  def update
    @user = User.find(params["user_id"])
    if @user.token == params['token']
      @user.status = "Active"
      @user.save
    end
    redirect_to dashboard_path
  end
end
