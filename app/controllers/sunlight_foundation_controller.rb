class SunlightFoundationController < ApplicationController
	respond_to :html, :json
  include HTTParty

  def index
		@bills = Congress.bills
	end

	def words
		@words_data = HTTParty.get("http://capitolwords.org/api/1/phrases/state.json?phrase=#{params[:phrase]}&page=0&per_page=50&sort=count&apikey=#{ENV['SUNLIGHT_API_KEY']}")
		@words_data["results"].each do |result|
			result["state"] = result["state"].downcase
		end
		respond_with({features: @words_data})

	end
	
end

 