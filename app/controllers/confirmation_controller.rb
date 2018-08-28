class ConfirmationController < ApplicationController
  def create
    ConfirmationMailer.confirmation(current_user).deliver_now
    redirect_to dashboard_path
  end

  def update
    @user = User.find(params["user_id"])
    @user.status = "Active"
    @user.save
  end
end
