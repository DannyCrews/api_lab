namespace :epa_import do
  # rake epa_import:facility
  desc "import epa database facilities tables"
  task facility: :environment do

  	min = 25000
    max = 25099

	  50.times do 
			main_data = HTTParty.get("http://iaspub.epa.gov/enviro/efservice/PUB_DIM_FACILITY/ROWS/#{min}:#{max}/JSON")
	    main_data.each do |facility|
	      begin
	        new_object = Facility.create(facility)
	        puts new_object
	      rescue
	      end
	    end
		  min + 100
		  max + 100
	  end

  end



# rake epa_import:subp_emission
	desc "import epa database emissions tables"
	task subp_emission: :environment do
  require 'csv' 
		emissions_data = HTTParty.get("http://iaspub.epa.gov/enviro/efservice/PUB_FACTS_SUBP_GHG_EMISSION/CSV")
	  csv = CSV.parse(emissions_data, :headers => true)
	  csv.each do |row|
		  	facility_id = row[0]
		  	sub_part_id = row[1]
		  	co2_emission = row[2]
		  	gas_id = row[3]
		  	year = row[4]
	  	new_object = SubpEmission.create(FACILITY_ID: facility_id, SUB_PART_ID: sub_part_id, CO2E_EMISSION: co2_emission, GAS_ID: gas_id, YEAR: year)
	  	puts new_object

	  end
	end

	# rake epa_import:sector_emission
	desc "import epa database sector emissions tables"
	task sector_emission: :environment do
  require 'csv' 
		emissions_data = HTTParty.get("http://iaspub.epa.gov/enviro/efservice/PUB_FACTS_SECTOR_GHG_EMISSION/CSV")
	  csv = CSV.parse(emissions_data, :headers => true)
	  csv.each do |row|
	
		  	facility_id = row[0]
		  	year = row[1]
		  	sector_id = row[2]
		  	subsector_id = row[3]
		  	gas_id = row[4]
		  	co2e_emission = row[5]
	  	new_object = SectorEmission.create(FACILITY_ID: facility_id, SECTOR_ID: sector_id, SUBSECTOR_ID: subsector_id, CO2E_EMISSION: co2e_emission, GAS_ID: gas_id, YEAR: year)
	  	puts new_object

	  end
	end

		# rake epa_import:greenhouse_gas
	desc "import epa database greenhouse gas tables"
	task greenhouse_gas: :environment do
  require 'csv' 
		emissions_data = HTTParty.get("http://iaspub.epa.gov/enviro/efservice/PUB_DIM_GHG/CSV")
	  csv = CSV.parse(emissions_data, :headers => true)
	  csv.each do |row|
		  	gas_id = row[0]
		  	gas_code = row[1]
		  	gas_name = row[2]
		  	gas_label = row[3]

	  	new_object = GreenhouseGas.create(GAS_NAME: gas_name, GAS_LABEL: gas_label, GAS_CODE: gas_code, GAS_ID: gas_id)
	  	puts new_object

	  end
	end

	# rake epa_import:subpart
	desc "import epa database subpart tables"
	task subpart: :environment do
  require 'csv' 
		emissions_data = HTTParty.get("http://iaspub.epa.gov/enviro/efservice/PUB_DIM_SUBPART/CSV")
	  csv = CSV.parse(emissions_data, :headers => true)
	  csv.each do |row|
	 
		  	subpart_id = row[0]
		  	subpart_name = row[1]
		  	subpart_category = row[2]
		  	subpart_type = row[3]

	  	new_object = Subpart.create(SUBPART_ID: subpart_id, SUBPART_NAME: subpart_name, SUBPART_CATEGORY: subpart_category, SUBPART_TYPE: subpart_type)
	  	puts new_object

	  end
	end

	# rake epa_import:sector
	desc "import epa database sector tables"
	task sector: :environment do
  require 'csv' 
		emissions_data = HTTParty.get("http://iaspub.epa.gov/enviro/efservice/PUB_DIM_SECTOR/CSV")
	  csv = CSV.parse(emissions_data, :headers => true)
	  csv.each do |row|

		  	sector_id = row[0]
		  	sector_code = row[1]
		  	sector_name = row[2]
		  	sector_type = row[3]
		  	sector_color = row[4]
		  	sort_order = row[5]

	  	new_object = Sector.create(SECTOR_ID: sector_id, SECTOR_NAME: sector_name, SECTOR_CODE: sector_code, SECTOR_TYPE: sector_type, SECTOR_COLOR: sector_color, SORT_ORDER: sort_order)
	  	puts new_object

	  end
	end

	# rake epa_import:subsector
	desc "import epa database subsector tables"
	task subsector: :environment do
  require 'csv' 
		emissions_data = HTTParty.get("http://iaspub.epa.gov/enviro/efservice/PUB_DIM_SUBSECTOR/CSV")
	  csv = CSV.parse(emissions_data, :headers => true)
	  csv.each do |row|

		  	subsector_id = row[0]
		  	subsector_name = row[1]
		  	subsector_desc = row[2]
		  	sector_id = row[3]
		  	subsector_order = row[4]

	  	new_object = Subsector.create(SUBSECTOR_ID: subsector_id, SECTOR_ID: sector_id, SUBSECTOR_NAME: subsector_name, SUBSECTOR_DESC: subsector_desc, SUBSECTOR_ORDER: subsector_order)
	  	puts new_object

	  end
	end

end



