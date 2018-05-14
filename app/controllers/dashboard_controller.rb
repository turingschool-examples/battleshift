class DashboardController < ApplicationController
  def show
    require 'pry'; binding.pry
    @user = User.find(params[:id])
  end
end
