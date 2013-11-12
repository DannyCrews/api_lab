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

ActiveRecord::Schema.define(version: 20131110194633) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "facilities", id: false, force: true do |t|
    t.integer "facility_id"
    t.float   "latitude"
    t.float   "longitude"
    t.string  "city"
    t.string  "state"
    t.string  "zip"
    t.string  "county_fips"
    t.string  "county"
    t.string  "address1"
    t.string  "address2"
    t.string  "facility_name"
    t.string  "state_name"
    t.string  "naics_code"
    t.string  "year"
    t.string  "bamm_used_desc"
    t.string  "emission_classification_code"
    t.string  "program_name"
    t.string  "program_sys_id"
    t.string  "frs_id"
    t.string  "cems_used"
    t.string  "co2_captured"
    t.string  "reported_subparts"
    t.boolean "bamm_approved"
    t.string  "emitted_co2_supplied"
    t.string  "tribal_land_id"
    t.string  "eggrt_facility_id"
    t.string  "public_html"
    t.string  "public_xml"
    t.json    "location"
    t.string  "parent_company"
    t.string  "public_xml_xml"
    t.string  "reported_industry_types"
    t.string  "facility_types"
    t.string  "submission_id"
    t.string  "uu_rd_exempt"
  end

  add_index "facilities", ["facility_id"], name: "index_facilities_on_facility_id", using: :btree

  create_table "greenhouse_gases", id: false, force: true do |t|
    t.string  "gas_name"
    t.string  "gas_label"
    t.string  "gas_code"
    t.integer "gas_id"
  end

  add_index "greenhouse_gases", ["gas_id"], name: "index_greenhouse_gases_on_gas_id", using: :btree

  create_table "sector_emissions", id: false, force: true do |t|
    t.float   "co2e_emission"
    t.integer "facility_id"
    t.integer "year"
    t.integer "sector_id"
    t.integer "subsector_id"
    t.integer "gas_id"
  end

  add_index "sector_emissions", ["facility_id"], name: "index_sector_emissions_on_facility_id", using: :btree
  add_index "sector_emissions", ["gas_id"], name: "index_sector_emissions_on_gas_id", using: :btree
  add_index "sector_emissions", ["sector_id"], name: "index_sector_emissions_on_sector_id", using: :btree

  create_table "sectors", id: false, force: true do |t|
    t.string  "sector_code"
    t.string  "sector_color"
    t.integer "sort_order"
    t.integer "sector_id"
    t.string  "sector_name"
    t.string  "sector_type"
  end

  add_index "sectors", ["sector_id"], name: "index_sectors_on_sector_id", using: :btree

  create_table "subp_emissions", id: false, force: true do |t|
    t.string  "facility_id"
    t.integer "subpart_id"
    t.float   "co2e_emission"
    t.integer "gas_id"
    t.integer "year"
  end

  add_index "subp_emissions", ["facility_id"], name: "index_subp_emissions_on_facility_id", using: :btree
  add_index "subp_emissions", ["subpart_id"], name: "index_subp_emissions_on_subpart_id", using: :btree

  create_table "subparts", id: false, force: true do |t|
    t.text    "subpart_category"
    t.integer "subpart_id"
    t.string  "subpart_name"
    t.string  "subpart_type"
  end

  add_index "subparts", ["subpart_id"], name: "index_subparts_on_subpart_id", using: :btree

  create_table "subsectors", id: false, force: true do |t|
    t.integer "subsector_id"
    t.string  "subsector_name"
    t.string  "subsector_desc"
    t.integer "sector_id"
    t.integer "subsector_order"
  end

  add_index "subsectors", ["sector_id"], name: "index_subsectors_on_sector_id", using: :btree

end
