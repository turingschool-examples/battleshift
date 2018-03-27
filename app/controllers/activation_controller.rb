class ActivationController < ApplicationController

  def update
    if current_user.update_attribute(:status, 1)
      flash[:notice] = "Thank you! Your account is now activated."
      redirect_to dashboard_path
    else
      flash[:error] = "Account couldn't be activated"
      redirect_to register_path
    end
  end

end
