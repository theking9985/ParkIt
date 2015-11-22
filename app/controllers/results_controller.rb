class ResultsController < ApplicationController

	def index
		if params[:search].present?
			
			@search = Property.near(params[:search], 20)
			@properties = @search.where("parking_quantity >= ?", params[:parking_quantity].to_i)

			@hash = Gmaps4rails.build_markers(@properties) do |property, marker|
			  marker.lat property.latitude
			  marker.lng property.longitude
			  marker.infowindow property.title
			end
		else
			@properties = Property.all
			@hash = Gmaps4rails.build_markers(@properties) do |property, marker|
			  marker.lat property.latitude
			  marker.lng property.longitude
			  marker.infowindow property.title
			end

		end
	end


	def show

	end

end
