class EpaFactsController < ApplicationController
	include HTTParty

  require 'open-uri' # from nokogiri xml parsing tutorial

  base_uri 'http://iaspub.epa.gov/enviro/efservice/PUB_DIM_FACILITY'
  
# website http://www.epa.gov/enviro/facts/ghg/summary_model.html

	def index
    @facilities = Facility.all
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
