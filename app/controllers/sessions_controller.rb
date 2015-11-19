class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate login_params['email'], login_params['password']

    if user
      session[:user_id] = user.user_id
      flash[:success] = "#{user.name} has logged in!"
      redirect_to login_path
    else
      flash[:danger] = "Incorrect email or password"
      redirect_to login_path
    end
  end

  def destroy
  end
end
