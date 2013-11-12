namespace :epa_import do
   # rake epa_import:emitters
  desc "import emitters data"
  task emitters: :environment do
  	import_emitters
  end

  # rake epa_import:facility
  desc "import epa database facilities tables"
  task facility: :environment do
    import_facilities
  end

# rake epa_import:subp_emission
	desc "import epa database emissions tables"
	task subp_emission: :environment do
    import_subp_emissions
	end

	# rake epa_import:sector_emission
	desc "import epa database sector emissions tables"
	task sector_emission: :environment do
    import_sector_emissions
	end

		# rake epa_import:greenhouse_gas
	desc "import epa database greenhouse gas tables"
	task greenhouse_gas: :environment do
    import_greenhouse_gases
	end

	# rake epa_import:subpart
	desc "import epa database subpart tables"
	task subpart: :environment do
    import_subparts
	end

	# rake epa_import:sector
	desc "import epa database sector tables"
	task sector: :environment do
    import_sectors
	end

	# rake epa_import:subsector
	desc "import epa database subsector tables"
	task subsector: :environment do
    import_subsectors
	end

	# rake epa_import:fuel_breakdown
	desc "import EIA database fuel breakdown tables"
	task fuel_breakdown: :environment do
		import_fuel_breakdown
	end

	# rake epa_import:all
	desc "import epa database all tables"
	task all: :environment do
    import_subp_emissions
    import_sector_emissions
    import_greenhouse_gases
    import_subparts
    import_sectors
    import_subsectors
    import_facilities
    import_emitters
    import_fuel_breakdown
	end

end

def import_facilities
  	min = 0
    max = 99

	  300.times do 
			main_data = HTTParty.get("http://iaspub.epa.gov/enviro/efservice/PUB_DIM_FACILITY/ROWS/#{min}:#{max}/JSON")
	    main_data.each do |facility|
	      begin
	      	facility.deep_transform_keys!(&:downcase)
	        new_object = Facility.create(facility)
	        puts new_object
	      rescue
	      end
	    end
		  min + 100
		  max + 100
	  end
end

def import_subp_emissions
  require 'csv' 
		emissions_data = HTTParty.get("http://iaspub.epa.gov/enviro/efservice/PUB_FACTS_SUBP_GHG_EMISSION/CSV")
	  csv = CSV.parse(emissions_data, :headers => true)
	  csv.each do |row|
		  	facility_id = row[0]
		  	subpart_id = row[1]
		  	co2e_emission = row[2]
		  	gas_id = row[3]
		  	year = row[4]
	  	new_object = SubpEmission.create(facility_id: facility_id, subpart_id: subpart_id, co2e_emission: co2e_emission, gas_id: gas_id, year: year)
	  	puts new_object

	  end
end

def import_sector_emissions
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
	  	new_object = SectorEmission.create(facility_id: facility_id, sector_id: sector_id, subsector_id: subsector_id, co2e_emission: co2e_emission, gas_id: gas_id, year: year)
	  	puts new_object
	  end
end

def import_greenhouse_gases
require 'csv' 
		emissions_data = HTTParty.get("http://iaspub.epa.gov/enviro/efservice/PUB_DIM_GHG/CSV")
	  csv = CSV.parse(emissions_data, :headers => true)
	  csv.each do |row|
		  	gas_id = row[0]
		  	gas_code = row[1]
		  	gas_name = row[2]
		  	gas_label = row[3]

	  	new_object = GreenhouseGas.create(gas_name: gas_name, gas_label: gas_label, gas_code: gas_code, gas_id: gas_id)
	  	puts new_object

	  end
end

def import_subparts
require 'csv' 
		emissions_data = HTTParty.get("http://iaspub.epa.gov/enviro/efservice/PUB_DIM_SUBPART/CSV")
	  csv = CSV.parse(emissions_data, :headers => true)
	  csv.each do |row|
	 
		  	subpart_id = row[0]
		  	subpart_name = row[1]
		  	subpart_category = row[2]
		  	subpart_type = row[3]

	  	new_object = Subpart.create(subpart_id: subpart_id, subpart_name: subpart_name, subpart_category: subpart_category, subpart_type: subpart_type)
	  	puts new_object

	  end
end

def import_sectors
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

	  	new_object = Sector.create(sector_id: sector_id, sector_name: sector_name, sector_code: sector_code, sector_type: sector_type, sector_color: sector_color, sort_order: sort_order)
	  	puts new_object
	  end
end

def import_subsectors
  require 'csv' 
		emissions_data = HTTParty.get("http://iaspub.epa.gov/enviro/efservice/PUB_DIM_SUBSECTOR/CSV")
	  csv = CSV.parse(emissions_data, :headers => true)
	  csv.each do |row|

		  	subsector_id = row[0]
		  	subsector_name = row[1]
		  	subsector_desc = row[2]
		  	sector_id = row[3]
		  	subsector_order = row[4]

	  	new_object = Subsector.create(subsector_id: subsector_id, sector_id: sector_id, subsector_name: subsector_name, subsector_desc: subsector_desc, subsector_order: subsector_order)
	  	puts new_object

	  end
end

def import_emitters
  require 'csv' 
  files = ["app/assets/data/Emitter_2010.csv", "app/assets/data/Emitters_2011.csv", "app/assets/data/Emitters_2012.csv"]
		files.each do |file|
			emissions_data = File.open(file)
		  csv = CSV.parse(emissions_data, :headers => true)
		  csv.each do |row|
	      n = 0
				county = row[n]
				n += 1
				facility_id = row[n]
				n += 1
				facility_name = row[n]
				n += 1
				latitude = row[n]
				n += 1
				longitude = row[n]
				n += 1
				state = row[n]
				n += 1
				state_name = row[n]
				n += 1
				ch4_emissions_co2e = row[n]
				n += 1
				fuel_type = row[n]
				n += 1
				fuel_type_blend = row[n]
				n += 1
				fuel_type_other = row[n]
				n += 1
				reporting_year = row[n]
				n += 1
				ghg_name = row[n]
				n += 1
				ghg_quantity = row[n]
				n += 1

		  	new_object = Emitter.create(county: county, 
																		facility_id: facility_id, 
																		facility_name: facility_name, 
																		latitude: latitude, 
																		longitude: longitude, 
																		state: state, 
																		state_name: state_name, 
																		ch4_emissions_co2e: ch4_emissions_co2e, 
																		fuel_type: fuel_type, 
																		fuel_type_blend: fuel_type_blend, 
																		fuel_type_other: fuel_type_other, 
																		reporting_year: reporting_year, 
																		ghg_name: ghg_name, 
																		ghg_quantity: ghg_quantity)

		  	puts new_object

		  end
		end
end

def import_fuel_breakdown
	require 'csv' 
	emissions_data = File.open("app/assets/data/annual_generation_state.csv")
		  csv = CSV.parse(emissions_data, :headers => true)
		  csv.each do |row|
		  	n = 0
				year = row[n]
				n += 1
				state_abbr = row[n]
				n += 1
				prod_type = row[n]
				n += 1
				fuel_type = row[n]
				n += 1
				generation = row[n]

				new_object = FuelBreakdown.create(year: year,
																		 state_abbr: state_abbr,
																		 prod_type: prod_type,
																		 fuel_type: fuel_type,
																		 generation: generation)	
				puts new_object
		  end
end






