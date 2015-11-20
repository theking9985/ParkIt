class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate login_params['email'], login_params['password']

    if user
      session[:user_id] = user.id
      flash[:success] = "#{user.name} has logged in!"
      redirect_to root_path
    else
      flash[:danger] = "Incorrect email or password"
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:info] = 'You have logged out!'
    redirect_to root_path
  end

  private
  def login_params
    params.require(:user).permit(:email, :password)
  end
end
