class CreateFacilities < ActiveRecord::Migration
  def change
    create_table :facilities, id:false do |t|
      t.integer :facility_id, index: true
      t.float :latitude
      t.float :longitude
      t.string :city
      t.string :state
      t.string :zip
      t.string :county_fips
      t.string :county
      t.string :address1
      t.string :address2
      t.string :facility_name
      t.string :state_name
      t.string :naics_code
      t.string :year
      t.string :bamm_used_desc
      t.string :emission_classification_code
      t.string :program_name
      t.string :program_sys_id
      t.string :frs_id
      t.string :cems_used
      t.string :co2_captured
      t.string :reported_subparts
      t.boolean :bamm_approved
      t.string :emitted_co2_supplied
      t.string :tribal_land_id
      t.string :eggrt_facility_id
      t.string :public_html
      t.string :public_xml
      t.json :location
      t.string :parent_company
      t.string :public_xml_xml
      t.string :reported_industry_types
      t.string :facility_types
      t.string :submission_id
      t.string :uu_rd_exempt
    end
    add_index :facilities, :facility_id
  end
end
