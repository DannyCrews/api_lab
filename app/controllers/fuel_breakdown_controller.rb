class FuelBreakdownController < ApplicationController
	respond_to :html, :json, :js

	def index
		respond_with FuelBreakdown.where(prod_type: "Total Electric Power Industry")		
	end

end