class ResultsController < ApplicationController

	def index
		if params[:search].present?			
			@properties = Property.near(params[:search], 100)
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
