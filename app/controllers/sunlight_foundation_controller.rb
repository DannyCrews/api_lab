class SunlightFoundationController < ApplicationController
  
  def index
		@bills = Congress.bills
	end
	
end

 