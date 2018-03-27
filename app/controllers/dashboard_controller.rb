class DashboardController < ApplicationController

  def index
    if current_user.inactive?
      flash[:notice] = "This account has not yet been activated. Please check your email."
    end
  end

end
