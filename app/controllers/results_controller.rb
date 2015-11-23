class ResultsController < ApplicationController
	# working with city & parking
	def index
		if (params[:city] && params[:parking_quantity] && params[:checkin] && params[:checkout]).present?		
	 		@city = Property.near(params[:city], 20)
	 		@parking = @city.where("parking_quantity >= ?", params[:parking_quantity].to_i)
	 		@properties = @parking.joins(:reservations).where("checkin >= ?", params[:checkin]).where("checkout <= ?", params[:checkout])

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
	end

	def create
		Property.create property_params
		redirect_to result_path
	end

	private
	def property_params
		params.require(:property).permit(:origin, :destination)
	end	

end
