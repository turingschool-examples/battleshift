class NotificationController < ApplicationController
  def create
    BattleshipNotifierMailer.welcome(current_user).deliver_now
    flash[:notice] = "Check your registered email in order to activate your account."
    redirect_to "/dashboard/#{current_user.id}"
  end
end
