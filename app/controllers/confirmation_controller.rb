class ConfirmationController < ApplicationController

  def show
    redirect_to users_confirm_email_url
  end
end
