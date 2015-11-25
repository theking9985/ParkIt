class UsersController < ApplicationController
  def new
  end

  def create
    user = User.create user_params
    puts user.errors.inspect
    if user.valid?
      session[:user_id] = user.id
      flash[:success] = 'User created and logged in'
      redirect_to root_path
    else
      messages = user.errors.map { |k, v| "#{k} #{v}" }
      flash[:danger] = messages.join(', ')
      redirect_to signup_path
    end
  end

  def show
      @user = User.find(params[:id])
      # @properties = Property.find params[:user_id]
      
      # SELECT p.*
      # FROM property p
      # JOIN user u ON p.user_id = u.id
      # WHERE p.user_id = @user
      @properties = Property.all.where({user_id: @user})

      @reservations = Reservation.all.where({user_id: @user})

      # @myhosted = Reservation.all.where({user_id: @current_user.id})
      # @myhosted = Reservation.joins(:properties).where({user_id: @current_user.id})
      
      # @myhosted = Property.joins(:reservations).where({"user_id" =>  @current_user.id})
      @myhosted = Reservation.joins(:property).where({"properties.user_id" =>  @current_user.id})

      


      
  end

  def edit 
    @user = User.find params[:id]
    @properties = Property.all
  end

  def update

  end

  private
  def user_params
    params.require(:user).permit( :name, :email, :password, :password_confirmation, :phone)
  end
end
