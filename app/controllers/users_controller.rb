class UsersController < ApplicationController
  # def index
  #   @users = User.all
  # end

  def create
    @user = User.new(user_params)
    if @user.save
      found_user = User.find_by(username: params[:user][:username])
      if found_user && found_user.authenticate(params[:user][:password])
        session[:user_id] = found_user.id
        redirect_to @user
      else
        # erb :'/sessions/new'
      end
    else
      @errors = @user.errors.full_messages
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password, :first_name, :last_name, :gender, :zip_code)
  end

end
