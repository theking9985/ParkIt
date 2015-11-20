class ResultsController < ApplicationController

	def index
		

		# @users = User.all

		@properties = Property.all
		@hash = Gmaps4rails.build_markers(@properties) do |property, marker|
		  marker.lat property.latitude
		  marker.lng property.longitude
		  marker.infowindow property.title
		  marker.infowindow property.description
		  # marker.json{ }
		end
	end


	






	

	def show

	end

end
