class PropertiesController < ApplicationController

  before_action :current_user 

	attr_accessor :latitude

  def index
  	@properties = Property.all
  end

  def create
  	@current_user.properties.create property_params
    redirect_to properties_path
  end

  def new
  	@property = Property.new
  end

  def edit
    @property = Property.find params[:id]
  end

  def update
    property = Property.find params[:id]
    property.update property_params
    profile = property.user_id
    redirect_to user_path(profile)
  end

  def destroy
    Property.find(params[:id]).delete
    redirect_to root_path
  end

  private

  def property_params
  	params.require(:property).permit(:parking_quantity, :price, :title, :description, :user_id)
  end


end
