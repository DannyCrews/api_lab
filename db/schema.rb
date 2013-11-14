# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20131112212152) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "emitters", force: true do |t|
    t.integer "facility_id"
    t.string  "facility_name"
    t.float   "latitude"
    t.float   "longitude"
    t.string  "state"
    t.string  "state_name"
    t.string  "county"
    t.string  "ch4_emissions_co2e"
    t.string  "fuel_type"
    t.string  "fuel_type_blend"
    t.string  "fuel_type_other"
    t.integer "reporting_year"
    t.string  "ghg_name"
    t.float   "ghg_quantity"
    t.integer "county_id"
  end

  add_index "emitters", ["county_id"], name: "index_emitters_on_county_id", using: :btree
  add_index "emitters", ["facility_id"], name: "index_emitters_on_facility_id", using: :btree

  create_table "facilities", id: false, force: true do |t|
    t.integer "FACILITY_ID"
    t.float   "LATITUDE"
    t.float   "LONGITUDE"
    t.string  "CITY"
    t.string  "STATE"
    t.string  "ZIP"
    t.string  "COUNTY_FIPS"
    t.string  "COUNTY"
    t.string  "ADDRESS1"
    t.string  "ADDRESS2"
    t.string  "FACILITY_NAME"
    t.string  "STATE_NAME"
    t.string  "NAICS_CODE"
    t.string  "YEAR"
    t.string  "BAMM_USED_DESC"
    t.string  "EMISSION_CLASSIFICATION_CODE"
    t.string  "PROGRAM_NAME"
    t.string  "PROGRAM_SYS_ID"
    t.string  "FRS_ID"
    t.string  "CEMS_USED"
    t.string  "CO2_CAPTURED"
    t.string  "REPORTED_SUBPARTS"
    t.boolean "BAMM_APPROVED"
    t.string  "EMITTED_CO2_SUPPLIED"
    t.string  "TRIBAL_LAND_ID"
    t.string  "EGGRT_FACILITY_ID"
    t.string  "PUBLIC_HTML"
    t.string  "PUBLIC_XML"
    t.json    "LOCATION"
    t.string  "PARENT_COMPANY"
    t.string  "PUBLIC_XML_XML"
    t.string  "REPORTED_INDUSTRY_TYPES"
    t.string  "FACILITY_TYPES"
    t.string  "SUBMISSION_ID"
    t.string  "UU_RD_EXEMPT"
  end

  add_index "facilities", ["FACILITY_ID"], name: "index_facilities_on_FACILITY_ID", using: :btree

  create_table "fuel_breakdowns", force: true do |t|
    t.integer "year"
    t.string  "state_abbr"
    t.string  "prod_type"
    t.string  "fuel_type"
    t.string  "generation"
  end

  create_table "greenhouse_gases", id: false, force: true do |t|
    t.string  "GAS_NAME"
    t.string  "GAS_LABEL"
    t.integer "GAS_CODE"
    t.integer "GAS_ID"
  end

  add_index "greenhouse_gases", ["GAS_ID"], name: "index_greenhouse_gases_on_GAS_ID", using: :btree

  create_table "sector_emissions", id: false, force: true do |t|
    t.float   "CO2E_EMISSION"
    t.integer "FACILITY_ID"
    t.integer "YEAR"
    t.integer "SECTOR_ID"
    t.integer "SUBSECTOR_ID"
    t.integer "GAS_ID"
  end

  add_index "sector_emissions", ["FACILITY_ID"], name: "index_sector_emissions_on_FACILITY_ID", using: :btree
  add_index "sector_emissions", ["GAS_ID"], name: "index_sector_emissions_on_GAS_ID", using: :btree
  add_index "sector_emissions", ["SECTOR_ID"], name: "index_sector_emissions_on_SECTOR_ID", using: :btree

  create_table "sectors", id: false, force: true do |t|
    t.string  "SECTOR_CODE"
    t.string  "SECTOR_COLOR"
    t.integer "SORT_ORDER"
    t.integer "SECTOR_ID"
    t.string  "SECTOR_NAME"
    t.string  "SECTOR_TYPE"
  end

  add_index "sectors", ["SECTOR_ID"], name: "index_sectors_on_SECTOR_ID", using: :btree

  create_table "subp_emissions", id: false, force: true do |t|
    t.string  "FACILITY_ID"
    t.integer "SUB_PART_ID"
    t.float   "CO2E_EMISSION"
    t.integer "GAS_ID"
    t.integer "YEAR"
  end

  add_index "subp_emissions", ["FACILITY_ID"], name: "index_subp_emissions_on_FACILITY_ID", using: :btree
  add_index "subp_emissions", ["SUB_PART_ID"], name: "index_subp_emissions_on_SUB_PART_ID", using: :btree

  create_table "subparts", id: false, force: true do |t|
    t.text    "SUBPART_CATEGORY"
    t.integer "SUBPART_ID"
    t.string  "SUBPART_NAME"
    t.string  "SUBPART_TYPE"
  end

  add_index "subparts", ["SUBPART_ID"], name: "index_subparts_on_SUBPART_ID", using: :btree

  create_table "subsectors", id: false, force: true do |t|
    t.integer "SUBSECTOR_ID"
    t.string  "SUBSECTOR_NAME"
    t.string  "SUBSECTOR_DESC"
    t.integer "SECTOR_ID"
    t.integer "SUBSECTOR_ORDER"
  end

  add_index "subsectors", ["SECTOR_ID"], name: "index_subsectors_on_SECTOR_ID", using: :btree

end
