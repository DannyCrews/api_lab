class Facility < ActiveRecord::Base
	def from_xml(xml_data)
	  facility = Facility.new
	  facility.from_xml(extract_xml_from(xml_data))
	  facility.save
	end
end
