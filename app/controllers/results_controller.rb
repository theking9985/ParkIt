class ResultsController < ApplicationController
	
	def index
		if (params[:city] && params[:parking_quantity] && params[:checkin] && params[:checkout]).present?
	 		@city = Property.near(params[:city], 20)
	 		@properties = @city.where("parking_quantity >= ?", params[:parking_quantity].to_i)
	 		@properties.each do |property|
	 			res = Reservation.where("property_id = ? AND checkin >= ? AND checkout <= ?", property.id, params[:checkin], params[:checkout])
	 			property.available = property.parking_quantity - res.length
	 		end
	 		# @reservations = @properties.joins(:reservations).where("checkin >= ?", params[:checkin]).where("checkout <= ?", params[:checkout])

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
		@property = Property.find params[:id]
		@user = @property.user
		if !current_user
			flash[:danger] = "You must log in to reserve parking."
		end
	end

end
