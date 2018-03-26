class RegistrationController < ApplicationController

  def show
  end

  def new
  end

  def create
    redirect_to dashboard_path
  end

end
