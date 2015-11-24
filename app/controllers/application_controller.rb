class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  rescue_from ActiveRecord::RecordNotFound, :with => :not_found
  protect_from_forgery with: :exception
  before_action :current_user

  def is_authenticated?
    unless current_user
      flash[:warning] = "You need to be logged in to do that"
    end
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  private
    def not_found
      render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
    end
end
