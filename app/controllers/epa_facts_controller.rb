class EpaFactsController < ApplicationController
	respond_to :html, :json
  include HTTParty

  # require 'open-uri' # from nokogiri xml parsing tutorial

  # base_uri 'http://iaspub.epa.gov/enviro/efservice/PUB_DIM_FACILITY'
  
# website http://www.epa.gov/enviro/facts/ghg/summary_model.html

def index
    @main_data = HTTParty.get('http://iaspub.epa.gov/enviro/efservice/PUB_DIM_FACILITY/ROWS/0:50/XML')
    @emissions_data = HTTParty.get('http://iaspub.epa.gov/enviro/efservice/PUB_FACTS_SUBP_GHG_EMISSION/ROWS/0:50/XML')
    @bills = Congress.bills_search(:query => "green house gases")

    # Variable and function for state-based fuel data
    state_abbr = params[:state_abbr]
    respond_with FuelBreakdown.where(prod_type: "Total Electric Power Industry").where(state_abbr: state_abbr)

end

def emitters_data
  respond_with Emitter.all
end


	# def index
 #    @facilities = Facility.all
 #  end


  # def facilities.js
  #   Facility.all.to_json
  # end

	# def posts(options={})
 #    self.class.get('/posts/get', options)
 #  end

  # def initialize(u, p)
  # end

  # # which can be :friends, :user or :public
  # # options[:query] can be things like since, since_id, count, etc.
  # def timeline(which=:friends, options={})
  #   options.merge!({:basic_auth => @auth})
  #   self.class.get("/statuses/#{which}_timeline.json", options)
  # end

  # def post(text)
  #   options = { :body => {:status => text}, :basic_auth => @auth }
  #   self.class.post('/statuses/update.json', options)
  # end
end
