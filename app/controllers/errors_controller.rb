class ErrorsController < ApplicationController
	def routing
		render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
	end

	def unacceptable
		render :status => 422
	end

	def internal_error
		render :status => 500
	end
end