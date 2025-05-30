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
  class WebhookEventResourceType
    CHECK = "check".freeze
    REPORT = "report".freeze
    AUDIT_LOG = "audit_log".freeze
    WORKFLOW_RUN = "workflow_run".freeze
    WORKFLOW_TASK = "workflow_task".freeze
    WATCHLIST_MONITOR = "watchlist_monitor".freeze
    WORKFLOW_TIMELINE_FILE = "workflow_timeline_file".freeze
    WORKFLOW_RUN_EVIDENCE_FOLDER = "workflow_run_evidence_folder".freeze
    UNKNOWN_DEFAULT_OPEN_API = "unknown_default_open_api".freeze

    def self.all_vars
      @all_vars ||= [CHECK, REPORT, AUDIT_LOG, WORKFLOW_RUN, WORKFLOW_TASK, WATCHLIST_MONITOR, WORKFLOW_TIMELINE_FILE, WORKFLOW_RUN_EVIDENCE_FOLDER, UNKNOWN_DEFAULT_OPEN_API].freeze
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
      return value if WebhookEventResourceType.all_vars.include?(value)
      raise "Invalid ENUM value #{value} for class #WebhookEventResourceType"
    end
  end
end
