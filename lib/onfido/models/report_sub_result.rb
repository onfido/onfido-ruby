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
  class ReportSubResult
    CLEAR = "clear".freeze
    REJECTED = "rejected".freeze
    SUSPECTED = "suspected".freeze
    CAUTION = "caution".freeze
    UNKNOWN_DEFAULT_OPEN_API = "unknown_default_open_api".freeze

    def self.all_vars
      @all_vars ||= [CLEAR, REJECTED, SUSPECTED, CAUTION, UNKNOWN_DEFAULT_OPEN_API].freeze
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
      return value if ReportSubResult.all_vars.include?(value)
      raise "Invalid ENUM value #{value} for class #ReportSubResult"
    end
  end
end
