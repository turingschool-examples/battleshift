class WelcomeController < ApplicationController

  def index
  end

  def show
    binding.pry
    @user = User.find_by(api_key: params[:api_key])
  end

end
