# class SessionsController < ApplicationController
#   def create
#     user = User.find_by(username: params[:username])
#     if user && user.authenticate(params[:password])
#       session[:user_id] = user.id
#       flash[:success] = "Logged in as #{user.name}"
#       redirect_to '/dashboard'
#     else
#       render :new
#     end
#   end
# end
