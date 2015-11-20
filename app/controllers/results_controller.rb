class ResultsController < ApplicationController

	def index		
		@properties = Property.all
		@hash = Gmaps4rails.build_markers(@properties) do |property, marker|
		  marker.lat property.latitude
		  marker.lng property.longitude
		  marker.infowindow property.title
		end
	end


	def show

	end

end
