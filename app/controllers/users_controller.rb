class UsersController < ApplicationController

  def new
    @user = User.new
  end 

  def create
    user = User.new(user_params)
   
    if user.save
      flash[:notice] = "Logged in as #{user.name}"
     session[:user_id] = user.id
     RegistrationMailer.activate(user).deliver_now
      redirect_to '/dashboard'
    else 
      flash[:error] = "User creation failed. Please make sure to fill in all the required fields."
      redirect_to '/register'
    end 
  end 

  def show
    if current_user.is_activated
      @message = "Status: Active"
    else 
      @message = "This account has not been activated. Please check your email."
    end 
  end
  
  private

  def user_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation)
  end
end 