class CreateFacilities < ActiveRecord::Migration
  def change
    create_table :facilities, id:false do |t|
      t.integer :FACILITY_ID, index: true
      t.float :LATITUDE
      t.float :LONGITUDE
      t.string :CITY
      t.string :STATE
      t.string :ZIP
      t.string :COUNTY_FIPS
      t.string :COUNTY
      t.string :ADDRESS1
      t.string :ADDRESS2
      t.string :FACILITY_NAME
      t.string :STATE_NAME
      t.string :NAICS_CODE
      t.string :YEAR
      t.string :BAMM_USED_DESC
      t.string :EMISSION_CLASSIFICATION_CODE
      t.string :PROGRAM_NAME
      t.string :PROGRAM_SYS_ID
      t.string :FRS_ID
      t.string :CEMS_USED
      t.string :CO2_CAPTURED
      t.string :REPORTED_SUBPARTS
      t.boolean :BAMM_APPROVED
      t.string :EMITTED_CO2_SUPPLIED
      t.string :TRIBAL_LAND_ID
      t.string :EGGRT_FACILITY_ID
      t.string :PUBLIC_HTML
      t.string :PUBLIC_XML
      t.json :LOCATION
      t.string :PARENT_COMPANY
      t.string :PUBLIC_XML_XML
      t.string :REPORTED_INDUSTRY_TYPES
      t.string :FACILITY_TYPES
      t.string :SUBMISSION_ID
      t.string :UU_RD_EXEMPT
    end
    add_index :facilities, :FACILITY_ID
  end
end
