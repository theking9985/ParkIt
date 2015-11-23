class PropertiesController < ApplicationController

	attr_accessor :latitude

  def index
  	@properties = Property.all
    # @properties = Property.find params[:id]
  end

  def create
  	Property.create property_params
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
  	params.require(:property).permit(:address, :parking_quantity, :price, :title, :description)
  end


end
