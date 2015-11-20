class ResultsController < ApplicationController

	def index
		

		# @users = User.all

		@properties = Property.all
		@hash = Gmaps4rails.build_markers(@users) do |user, marker|
		#   marker.lat user.latitude
		#   marker.lng user.longitude
		  marker.infowindow property.description
		end
	end


	






	

	def show

	end

end
