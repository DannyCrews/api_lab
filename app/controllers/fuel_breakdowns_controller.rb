class FuelBreakdownsController < ApplicationController
	respond_to :html, :json, :js

	def index
		respond_with FuelBreakdown.where(prod_type: "Total Electric Power Industry")
		# respond_with(@fuel_breakdown = FuelBreakdown.where(prod_type: "Total Electric Power Industry"))
	end

end