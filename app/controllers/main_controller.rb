class MainController < ApplicationController
  respond_to :html, :xml, :json

  def emitters_map
  	@emitters = Emitter.all
  	respond_with(@emitters.to_json)

  end

end
