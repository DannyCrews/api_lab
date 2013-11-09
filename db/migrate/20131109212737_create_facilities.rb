class CreateFacilities < ActiveRecord::Migration
  def change
    create_table :facilities do |t|
      t.integer :facility_id
      t.float :latitude
      t.float :longitude
      t.string :city
      t.string :state
      t.integer :zip
      t.integer :county_fips
      t.string :county
      t.string :address1
      t.string :address2
      t.string :facility_name
      t.string :state_name
      t.integer :naics_code
      t.integer :year
      t.string :bamm_used_desc
      t.string :emission_classification_code
      t.string :program_name
      t.integer :program_sys_id
      t.integer :frs_id
      t.string :cems_used
      t.string :co2_captured
      t.string :reported_subparts
      t.boolean :bamm_aproved
      t.string :emitted_co2_supplied
      t.integer :tribal_land_id
      t.integer :eggrt_facility_id
      t.string :public_html
      t.string :public_xml_xml
      t.string :reported_industry_types
      t.string :facility_types
      t.integer :submission_id
      t.string :uu_rd_exempt
    end
  end
end
