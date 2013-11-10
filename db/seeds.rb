# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'    

min = 0
max = 99

10.times do 
		main_data = HTTParty.get("http://iaspub.epa.gov/enviro/efservice/PUB_DIM_FACILITY/ROWS/#{min}:#{max}/JSON")
    main_data.each do |facility|
      begin
        Facility.create(facility, id: facility["FACILITY_ID"])
      rescue
      end
    end
  min + 100
  max + 100
end

# # not sure how to get this data from CSV into the database
# # or whether to make a new table indexed on facility_id,
# # or to make more columns in the facilities table.

# 10.times do 
# emissions_data = HTTParty.get("http://iaspub.epa.gov/enviro/efservice/PUB_FACTS_SUBP_GHG_EMISSION/ROWS/#{min}:#{max}/csv")
#     emissions_data.each do |facility|
#     	binding.pry
#       begin
#         Facility.create(facility)
#       rescue
#       end
#     end
#   min + 100
#   max + 100
# end



# csv_text = File.read('...')
# csv = CSV.parse(csv_text, :headers => true)
# csv.each do |row|
#   Facility.create!(row.to_hash)
# end