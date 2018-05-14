class RegistrationController < ApplicationController
  def update
    user = User.find(params[:user])
    user.update(authenticated: true)
    if user.save
      flash[:success] = 'Thank you for authenticating your account!'
    else
      flash[:error] = 'Unable to authenticate your account.'
    end
    redirect_to dashboard_path
  end
end
