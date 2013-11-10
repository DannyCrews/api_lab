require 'nokogiri'
require 'open-uri'
require 'awesome_print'

# This shows what the data looks like but doesn't get it into the database.

# def self.xml_parser
    xml = Nokogiri::XML(open('http://iaspub.epa.gov/enviro/efservice/PUB_DIM_FACILITY/ROWS/0:100/XML'))
    facilities = xml.search("PUB_DIM_FACILITY")
    # .map do |facility|
    #   %w[ID LATITUDE LONGITUDE CITY STATE ZIP COUNTY_FIPS COUNTY ADDRESS1 ADDRESS2 FACILITY_NAME STATE_NAME NAICS_CODE YEAR BAMM_USED_DESC EMISSION_CLASSIFICATION_CODE PROGRAM_NAME PROGRAM_SYS_ID FRS_ID CEMS_USED CO2_CAPTURED REPORTED_SUBPARTS BAMM_APPROVED EMITTED_CO2_SUPPLIED TRIBAL_LAND_ID EGGRT_FACILITY_ID PUBLIC_HTML PUBLIC_XML SDO_ELEM_INFO SDO_ORDINATES PARENT_COMPANY PUBLIC_XML_XML REPORTED_INDUSTRY_TYPES FACILITY_TYPES SUBMISSION_ID UU_RD_EXEMPT ].each_with_object({}) do |n, o|
    #     o[n] = facility.at(n)
    # end
    # end
# end


# ap facilities

# This parses the xml into a hash that could become an object, 
# but was too labor-intensive to be a good solution

    facilities.each do |facility|
    begin
    facility_hash = {
        facility_id: facility.at_xpath("FACILITY_ID").text,
        latitude:  facility.at_xpath("LATITUDE").text,
        longitude: facility.at_xpath("LONGITUDE").text,
        city: facility.at_xpath("CITY").text,
        state: facility.at_xpath("STATE").text,
        zip: facility.at_xpath("COUNTY_FIPS").text,
        county_fips: facility.at_xpath("STATE").text,
        county: facility.at_xpath("COUNTY").text,
        address1: facility.at_xpath("ADDRESS1").text,
        address2: facility.at_xpath("ADDRESS2").text,
        facility_name: facility.at_xpath("FACILITY_NAME").text,
        state_name: facility.at_xpath("STATE_NAME").text,
        naics_code: facility.at_xpath("NAICS_CODE").text,
        year: facility.at_xpath("YEAR").text,
        bamm_used_desc:  facility.at_xpath("BAMM_USED_DESC").text,
        emission_classification_code: facility.at_xpath("EMISSION_CLASSIFICATION_CODE").text,
        program_name: facility.at_xpath("PROGRAM_NAME").text,
        program_sys_id: facility.at_xpath("PROGRAM_SYS_ID").text,
        frs_id: facility.at_xpath("FRS_ID").text,
        cems_used: facility.at_xpath("CEMS_USED").text,
        co2_captured: facility.at_xpath("CO2_CAPTURED").text,
        reported_subparts: facility.at_xpath("REPORTED_SUBPARTS").text,
        bamm_approved: facility.at_xpath("BAMM_APPROVED").text,
        emitted_co2_supplied: facility.at_xpath("EMITTED_CO2_SUPPLIED").text,
        tribal_land_id: facility.at_xpath("TRIBAL_LAND_ID").text,
        eggrt_facility_id: facility.at_xpath("EGGRT_FACILITY_ID").text,
        public_html: facility.at_xpath("PUBLIC_HTML").text,
        public_xml: facility.at_xpath("PUBLIC_XML").text,
        sdo_elem_info: facility.at_xpath("SDO_ELEM_INFO").text,
        sdo_ordinates: facility.at_xpath("SDO_ORDINATES").text,
        parent_company: facility.at_xpath("PARENT_COMPANY").text,
        public_xml_xml: facility.at_xpath("PUBLIC_XML_XML").text,
        reported_industry_types: facility.at_xpath("REPORTED_INDUSTRY_TYPES").text,
        facility_types: facility.at_xpath("FACILITY_TYPES").text,
        submission_id: facility.at_xpath("SUBMISSION_ID").text,
        uu_rd_exempt: facility.at_xpath("UU_RD_EXEMPT").text
     }

        facility_record = Facility.create!(facility_hash)
        facility_record.save
    rescue
    end

    end
