# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# require 'csv'    

# min = 0
# max = 99

# # 10.times do 
# # 		main_data = HTTParty.get("http://iaspub.epa.gov/enviro/efservice/PUB_DIM_FACILITY/ROWS/#{min}:#{max}/JSON")
# #     main_data.each do |facility|
# #       begin
# #         Facility.create(facility, id: facility["FACILITY_ID"])
# #       rescue
# #       end
# #     end
# #   min + 100
# #   max + 100
# # end

# # # not sure how to get this data from CSV into the database
# # # or whether to make a new table indexed on facility_id,
# # # or to make more columns in the facilities table.

# 10.times do 
# emissions_data = HTTParty.get("http://iaspub.epa.gov/enviro/efservice/PUB_FACTS_SUBP_GHG_EMISSION/ROWS/#{min}:#{max}/CSV")
#   csv = CSV.parse(emissions_data, :headers => true)
#   array = []
#   csv.each do |row|
#     array << row.to_hash
#   end

#   min + 100
#   max + 100

  
# new_array = []
# array.each do |row|
#     new_hash = {}
#     if row
#       key = row[0].sub('PUB_FACTS_SUBP_GHG_EMISSION.', '')
#       value = row[1]
#       new_hash[key] = value
#     end
#     new_array << new_hash
#   end

# end



# binding.pry



# # csv_text = File.read('...')

# # csv.each do |row|
# #   Facility.create!(row.to_hash)
# # end