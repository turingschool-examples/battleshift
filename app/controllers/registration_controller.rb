class RegistrationController < ApplicationController
  def update
    binding.pry
    user = User.find(params[:id])

  end
end
