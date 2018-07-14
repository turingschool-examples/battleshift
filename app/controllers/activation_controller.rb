class ActivationController < ApplicationController

    def show
      user = User.find_by(api_key: params[:key])
      user.is_activated = true
      if user.save!
        session[:user_id] = user.id
      else 
        #testing comment
      end 
    end

end