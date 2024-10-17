=begin
#Onfido API v3.6

#The Onfido API (v3.6)

The version of the OpenAPI document: v3.6

Generated by: https://openapi-generator.tech
Generator version: 7.8.0

=end

require 'date'
require 'time'

module Onfido
  class DocumentTypes
    PASSPORT = "passport".freeze
    DRIVING_LICENCE = "driving_licence".freeze
    NATIONAL_IDENTITY_CARD = "national_identity_card".freeze
    RESIDENCE_PERMIT = "residence_permit".freeze
    PASSPORT_CARD = "passport_card".freeze
    TAX_ID = "tax_id".freeze
    VISA = "visa".freeze
    VOTER_ID = "voter_id".freeze
    RESIDENCE_STATUS_DOCUMENT = "residence_status_document".freeze
    POSTAL_IDENTITY_CARD = "postal_identity_card".freeze
    SOCIAL_SECURITY_CARD = "social_security_card".freeze
    WORK_PERMIT = "work_permit".freeze
    ASYLUM_REGISTRATION_CARD = "asylum_registration_card".freeze
    NATIONAL_HEALTH_INSURANCE_CARD = "national_health_insurance_card".freeze
    MUNICIPALITY_IDENTITY_CARD = "municipality_identity_card".freeze
    PRIVATE_OPERATORS_CARD = "private_operators_card".freeze
    PROOF_OF_CITIZENSHIP = "proof_of_citizenship".freeze
    SERVICE_ID_CARD = "service_id_card".freeze
    IMMIGRATION_STATUS_DOCUMENT = "immigration_status_document".freeze
    INDIGENOUS_CARD = "indigenous_card".freeze
    VEHICLE_REGISTRATION_CARD = "vehicle_registration_card".freeze
    CERTIFICATE_OF_NATURALISATION = "certificate_of_naturalisation".freeze
    PROFESSIONAL_QUALIFICATION_CARD = "professional_qualification_card".freeze
    CONSULAR_ID = "consular_id".freeze
    INTERNATIONAL_DRIVING_LICENCE = "international_driving_licence".freeze
    UNKNOWN_DEFAULT_OPEN_API = "unknown_default_open_api".freeze

    def self.all_vars
      @all_vars ||= [PASSPORT, DRIVING_LICENCE, NATIONAL_IDENTITY_CARD, RESIDENCE_PERMIT, PASSPORT_CARD, TAX_ID, VISA, VOTER_ID, RESIDENCE_STATUS_DOCUMENT, POSTAL_IDENTITY_CARD, SOCIAL_SECURITY_CARD, WORK_PERMIT, ASYLUM_REGISTRATION_CARD, NATIONAL_HEALTH_INSURANCE_CARD, MUNICIPALITY_IDENTITY_CARD, PRIVATE_OPERATORS_CARD, PROOF_OF_CITIZENSHIP, SERVICE_ID_CARD, IMMIGRATION_STATUS_DOCUMENT, INDIGENOUS_CARD, VEHICLE_REGISTRATION_CARD, CERTIFICATE_OF_NATURALISATION, PROFESSIONAL_QUALIFICATION_CARD, CONSULAR_ID, INTERNATIONAL_DRIVING_LICENCE, UNKNOWN_DEFAULT_OPEN_API].freeze
    end

    # Builds the enum from string
    # @param [String] The enum value in the form of the string
    # @return [String] The enum value
    def self.build_from_hash(value)
      new.build_from_hash(value)
    end

    # Builds the enum from string
    # @param [String] The enum value in the form of the string
    # @return [String] The enum value
    def build_from_hash(value)
      return value if DocumentTypes.all_vars.include?(value)
      raise "Invalid ENUM value #{value} for class #DocumentTypes"
    end
  end
end
