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

end
