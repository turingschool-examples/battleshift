class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  def index
    @users = User.all
  end

  # GET /users/1
  def show
    @user = User.find(params[:id])
    if session[:activate] == true
      @user.update(activated: true)
      flash.now[:notice] = "User was activated."
    end
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  def create
    params = user_params.merge(api_key: User.generate_api_key)
    @user = User.new(params)
    if @user.save
      login(@user)
      redirect_to "/dashboard/#{@user.id}" 
      flash[:notice] = "Logged in as #{@user.username}"
    else
      render :new
    end
  end

  # PATCH/PUT /users/1
  def update
    require 'pry'; binding.pry
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:username, :first_name, :last_name, :password, :api_key, :activated)
    end
end
