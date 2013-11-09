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

ActiveRecord::Schema.define(version: 20131109212737) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "facilities", force: true do |t|
    t.integer "facility_id"
    t.float   "latitude"
    t.float   "longitude"
    t.string  "city"
    t.string  "state"
    t.integer "zip"
    t.integer "county_fips"
    t.string  "county"
    t.string  "address1"
    t.string  "address2"
    t.string  "facility_name"
    t.string  "state_name"
    t.integer "naics_code"
    t.integer "year"
    t.string  "bamm_used_desc"
    t.string  "emission_classification_code"
    t.string  "program_name"
    t.integer "program_sys_id"
    t.integer "frs_id"
    t.string  "cems_used"
    t.string  "co2_captured"
    t.string  "reported_subparts"
    t.boolean "bamm_aproved"
    t.string  "emitted_co2_supplied"
    t.integer "tribal_land_id"
    t.integer "eggrt_facility_id"
    t.string  "public_html"
    t.string  "public_xml_xml"
    t.string  "reported_industry_types"
    t.string  "facility_types"
    t.integer "submission_id"
    t.string  "uu_rd_exempt"
  end

end
