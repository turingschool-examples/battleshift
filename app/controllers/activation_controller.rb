class ActivationController < ApplicationController
  def show
    user = User.find_by_activation_key(params[:key])
    user.activated = true

    user.save
  end
end
