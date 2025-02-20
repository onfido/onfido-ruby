=begin
#Onfido API v3.6

#The Onfido API (v3.6)

The version of the OpenAPI document: v3.6

Generated by: https://openapi-generator.tech
Generator version: 7.11.0

=end

require 'date'
require 'time'

module Onfido
  class ReportName
    DOCUMENT = "document".freeze
    DOCUMENT_VIDEO = "document_video".freeze
    DOCUMENT_VIDEO_WITH_ADDRESS_INFORMATION = "document_video_with_address_information".freeze
    DOCUMENT_WITH_ADDRESS_INFORMATION = "document_with_address_information".freeze
    DOCUMENT_WITH_DRIVING_LICENCE_INFORMATION = "document_with_driving_licence_information".freeze
    DOCUMENT_WITH_DRIVER_VERIFICATION = "document_with_driver_verification".freeze
    FACIAL_SIMILARITY_PHOTO = "facial_similarity_photo".freeze
    FACIAL_SIMILARITY_PHOTO_FULLY_AUTO = "facial_similarity_photo_fully_auto".freeze
    FACIAL_SIMILARITY_VIDEO = "facial_similarity_video".freeze
    FACIAL_SIMILARITY_MOTION = "facial_similarity_motion".freeze
    KNOWN_FACES = "known_faces".freeze
    IDENTITY_ENHANCED = "identity_enhanced".freeze
    WATCHLIST_AML = "watchlist_aml".freeze
    WATCHLIST_ENHANCED = "watchlist_enhanced".freeze
    WATCHLIST_STANDARD = "watchlist_standard".freeze
    WATCHLIST_PEPS_ONLY = "watchlist_peps_only".freeze
    WATCHLIST_SANCTIONS_ONLY = "watchlist_sanctions_only".freeze
    PROOF_OF_ADDRESS = "proof_of_address".freeze
    US_DRIVING_LICENCE = "us_driving_licence".freeze
    DEVICE_INTELLIGENCE = "device_intelligence".freeze
    INDIA_PAN = "india_pan".freeze
    UNKNOWN_DEFAULT_OPEN_API = "unknown_default_open_api".freeze

    def self.all_vars
      @all_vars ||= [DOCUMENT, DOCUMENT_VIDEO, DOCUMENT_VIDEO_WITH_ADDRESS_INFORMATION, DOCUMENT_WITH_ADDRESS_INFORMATION, DOCUMENT_WITH_DRIVING_LICENCE_INFORMATION, DOCUMENT_WITH_DRIVER_VERIFICATION, FACIAL_SIMILARITY_PHOTO, FACIAL_SIMILARITY_PHOTO_FULLY_AUTO, FACIAL_SIMILARITY_VIDEO, FACIAL_SIMILARITY_MOTION, KNOWN_FACES, IDENTITY_ENHANCED, WATCHLIST_AML, WATCHLIST_ENHANCED, WATCHLIST_STANDARD, WATCHLIST_PEPS_ONLY, WATCHLIST_SANCTIONS_ONLY, PROOF_OF_ADDRESS, US_DRIVING_LICENCE, DEVICE_INTELLIGENCE, INDIA_PAN, UNKNOWN_DEFAULT_OPEN_API].freeze
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
      return value if ReportName.all_vars.include?(value)
      raise "Invalid ENUM value #{value} for class #ReportName"
    end
  end
end
