class EpaFactsController < ApplicationController
	include HTTParty
  base_uri 'http://iaspub.epa.gov/enviro/efservice/PUB_DIM_FACILITY'
  
# website http://www.epa.gov/enviro/facts/ghg/summary_model.html

	def index
		@main_data = HTTParty.get('http://iaspub.epa.gov/enviro/efservice/PUB_DIM_FACILITY/ROWS/0:100/XML')
		@emissions_data = HTTParty.get('http://iaspub.epa.gov/enviro/efservice/PUB_FACTS_SUBP_GHG_EMISSION/ROWS/0:1000/XML')
	end

	# def posts(options={})
 #    self.class.get('/posts/get', options)
 #  end

  def query
	end

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
