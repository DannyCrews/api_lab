class MainController < ApplicationController
  respond_to :html, :xml, :json

  def index
  	@emitters = Emitter.all
  	respond_with(@emitters)
  end


end
