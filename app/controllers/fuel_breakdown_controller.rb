class FuelBreakdownController < ApplicationController
	respond_to :html, :json, :js

	def index
		state_abbr = params[:state_abbr]
		respond_with FuelBreakdown.where(prod_type: "Total Electric Power Industry").where(state_abbr: state_abbr)
	end

end