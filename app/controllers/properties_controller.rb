class PropertiesController < ApplicationController

	attr_accessor :latitude

  def index
  	@properties = Property.all
  end

  def create
  	Property.create property_params
	redirect_to properties_path
  end

  def new
  	@property = Property.new
  end



  private

  def property_params
  	params.require(:property).permit(:address, :parking_quantity, :price)
  end


end
