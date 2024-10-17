=begin
#Onfido API v3.6

#The Onfido API (v3.6)

The version of the OpenAPI document: v3.6

Generated by: https://openapi-generator.tech
Generator version: 7.9.0

=end

# Common files
require 'onfido/api_client'
require 'onfido/api_error'
require 'onfido/version'
require 'onfido/configuration'

# Models
require 'onfido/models/address'
require 'onfido/models/address_builder'
require 'onfido/models/address_shared'
require 'onfido/models/addresses_list'
require 'onfido/models/applicant'
require 'onfido/models/applicant_builder'
require 'onfido/models/applicant_create'
require 'onfido/models/applicant_request'
require 'onfido/models/applicant_response'
require 'onfido/models/applicant_shared'
require 'onfido/models/applicant_update'
require 'onfido/models/applicant_updater'
require 'onfido/models/applicants_list'
require 'onfido/models/check'
require 'onfido/models/check_builder'
require 'onfido/models/check_request'
require 'onfido/models/check_response'
require 'onfido/models/check_shared'
require 'onfido/models/checks_list'
require 'onfido/models/complete_task_builder'
require 'onfido/models/complete_task_data_builder'
require 'onfido/models/consent_item'
require 'onfido/models/consents_builder'
require 'onfido/models/country_codes'
require 'onfido/models/device_intelligence_breakdown'
require 'onfido/models/device_intelligence_breakdown_breakdown'
require 'onfido/models/device_intelligence_breakdown_breakdown_device'
require 'onfido/models/device_intelligence_breakdown_breakdown_device_breakdown'
require 'onfido/models/device_intelligence_breakdown_properties'
require 'onfido/models/device_intelligence_breakdown_properties_device'
require 'onfido/models/device_intelligence_breakdown_properties_geolocation'
require 'onfido/models/device_intelligence_breakdown_properties_ip'
require 'onfido/models/device_intelligence_report'
require 'onfido/models/document'
require 'onfido/models/document_breakdown'
require 'onfido/models/document_breakdown_age_validation'
require 'onfido/models/document_breakdown_age_validation_breakdown'
require 'onfido/models/document_breakdown_compromised_document'
require 'onfido/models/document_breakdown_compromised_document_breakdown'
require 'onfido/models/document_breakdown_data_comparison'
require 'onfido/models/document_breakdown_data_comparison_breakdown'
require 'onfido/models/document_breakdown_data_comparison_breakdown_issuing_country'
require 'onfido/models/document_breakdown_data_consistency'
require 'onfido/models/document_breakdown_data_consistency_breakdown'
require 'onfido/models/document_breakdown_data_validation'
require 'onfido/models/document_breakdown_data_validation_breakdown'
require 'onfido/models/document_breakdown_data_validation_breakdown_document_expiration'
require 'onfido/models/document_breakdown_data_validation_breakdown_expiry_date'
require 'onfido/models/document_breakdown_image_integrity'
require 'onfido/models/document_breakdown_image_integrity_breakdown'
require 'onfido/models/document_breakdown_image_integrity_breakdown_colour_picture'
require 'onfido/models/document_breakdown_image_integrity_breakdown_conclusive_document_quality'
require 'onfido/models/document_breakdown_image_integrity_breakdown_image_quality'
require 'onfido/models/document_breakdown_image_integrity_breakdown_supported_document'
require 'onfido/models/document_breakdown_issuing_authority'
require 'onfido/models/document_breakdown_issuing_authority_breakdown'
require 'onfido/models/document_breakdown_issuing_authority_breakdown_nfc_active_authentication'
require 'onfido/models/document_breakdown_issuing_authority_breakdown_nfc_passive_authentication'
require 'onfido/models/document_breakdown_police_record'
require 'onfido/models/document_breakdown_visual_authenticity'
require 'onfido/models/document_breakdown_visual_authenticity_breakdown'
require 'onfido/models/document_breakdown_visual_authenticity_breakdown_digital_tampering'
require 'onfido/models/document_breakdown_visual_authenticity_breakdown_face_detection'
require 'onfido/models/document_breakdown_visual_authenticity_breakdown_fonts'
require 'onfido/models/document_breakdown_visual_authenticity_breakdown_original_document_present'
require 'onfido/models/document_breakdown_visual_authenticity_breakdown_other'
require 'onfido/models/document_breakdown_visual_authenticity_breakdown_picture_face_integrity'
require 'onfido/models/document_breakdown_visual_authenticity_breakdown_security_features'
require 'onfido/models/document_breakdown_visual_authenticity_breakdown_template'
require 'onfido/models/document_cdq_reasons'
require 'onfido/models/document_iq_reasons'
require 'onfido/models/document_odp_reasons'
require 'onfido/models/document_properties'
require 'onfido/models/document_properties_address_lines'
require 'onfido/models/document_properties_barcode_inner'
require 'onfido/models/document_properties_document_classification'
require 'onfido/models/document_properties_document_numbers_inner'
require 'onfido/models/document_properties_driving_licence_information'
require 'onfido/models/document_properties_extracted_data'
require 'onfido/models/document_properties_nfc'
require 'onfido/models/document_report'
require 'onfido/models/document_response'
require 'onfido/models/document_shared'
require 'onfido/models/document_types'
require 'onfido/models/document_video_report'
require 'onfido/models/document_video_with_address_information_report'
require 'onfido/models/document_with_address_information_report'
require 'onfido/models/document_with_driver_verification_report'
require 'onfido/models/document_with_driver_verification_report_all_of_properties'
require 'onfido/models/document_with_driver_verification_report_all_of_properties_all_of_passenger_vehicle'
require 'onfido/models/document_with_driver_verification_report_all_of_properties_all_of_vehicle_class_details_inner'
require 'onfido/models/document_with_driving_licence_information_report'
require 'onfido/models/documents_list'
require 'onfido/models/error'
require 'onfido/models/error1'
require 'onfido/models/error_properties'
require 'onfido/models/error_properties1'
require 'onfido/models/extract_request'
require 'onfido/models/extraction'
require 'onfido/models/extraction_document_classification'
require 'onfido/models/extraction_extracted_data'
require 'onfido/models/facial_similarity_motion_breakdown'
require 'onfido/models/facial_similarity_motion_breakdown_face_comparison'
require 'onfido/models/facial_similarity_motion_breakdown_image_integrity'
require 'onfido/models/facial_similarity_motion_breakdown_image_integrity_breakdown'
require 'onfido/models/facial_similarity_motion_breakdown_image_integrity_breakdown_face_detected'
require 'onfido/models/facial_similarity_motion_breakdown_image_integrity_breakdown_source_integrity'
require 'onfido/models/facial_similarity_motion_breakdown_visual_authenticity'
require 'onfido/models/facial_similarity_motion_breakdown_visual_authenticity_breakdown'
require 'onfido/models/facial_similarity_motion_breakdown_visual_authenticity_breakdown_spoofing_detection'
require 'onfido/models/facial_similarity_motion_properties'
require 'onfido/models/facial_similarity_motion_report'
require 'onfido/models/facial_similarity_photo_breakdown'
require 'onfido/models/facial_similarity_photo_breakdown_face_comparison'
require 'onfido/models/facial_similarity_photo_breakdown_face_comparison_breakdown'
require 'onfido/models/facial_similarity_photo_breakdown_face_comparison_breakdown_face_match'
require 'onfido/models/facial_similarity_photo_breakdown_face_comparison_breakdown_face_match_properties'
require 'onfido/models/facial_similarity_photo_breakdown_image_integrity'
require 'onfido/models/facial_similarity_photo_breakdown_image_integrity_breakdown'
require 'onfido/models/facial_similarity_photo_breakdown_image_integrity_breakdown_face_detected'
require 'onfido/models/facial_similarity_photo_breakdown_image_integrity_breakdown_source_integrity'
require 'onfido/models/facial_similarity_photo_breakdown_visual_authenticity'
require 'onfido/models/facial_similarity_photo_breakdown_visual_authenticity_breakdown'
require 'onfido/models/facial_similarity_photo_breakdown_visual_authenticity_breakdown_spoofing_detection'
require 'onfido/models/facial_similarity_photo_breakdown_visual_authenticity_breakdown_spoofing_detection_properties'
require 'onfido/models/facial_similarity_photo_fully_auto_breakdown'
require 'onfido/models/facial_similarity_photo_fully_auto_breakdown_image_integrity'
require 'onfido/models/facial_similarity_photo_fully_auto_breakdown_image_integrity_breakdown'
require 'onfido/models/facial_similarity_photo_fully_auto_breakdown_image_integrity_breakdown_source_integrity'
require 'onfido/models/facial_similarity_photo_fully_auto_properties'
require 'onfido/models/facial_similarity_photo_fully_auto_report'
require 'onfido/models/facial_similarity_photo_properties'
require 'onfido/models/facial_similarity_photo_report'
require 'onfido/models/facial_similarity_video_breakdown'
require 'onfido/models/facial_similarity_video_breakdown_face_comparison'
require 'onfido/models/facial_similarity_video_breakdown_image_integrity'
require 'onfido/models/facial_similarity_video_breakdown_image_integrity_breakdown'
require 'onfido/models/facial_similarity_video_breakdown_image_integrity_breakdown_face_detected'
require 'onfido/models/facial_similarity_video_breakdown_image_integrity_breakdown_source_integrity'
require 'onfido/models/facial_similarity_video_breakdown_visual_authenticity'
require 'onfido/models/facial_similarity_video_breakdown_visual_authenticity_breakdown'
require 'onfido/models/facial_similarity_video_breakdown_visual_authenticity_breakdown_liveness_detected'
require 'onfido/models/facial_similarity_video_breakdown_visual_authenticity_breakdown_spoofing_detection'
require 'onfido/models/facial_similarity_video_properties'
require 'onfido/models/facial_similarity_video_report'
require 'onfido/models/id_number'
require 'onfido/models/id_photo'
require 'onfido/models/id_photo_response'
require 'onfido/models/id_photos_list'
require 'onfido/models/identity_enhanced_breakdown'
require 'onfido/models/identity_enhanced_breakdown_address'
require 'onfido/models/identity_enhanced_breakdown_address_breakdown'
require 'onfido/models/identity_enhanced_breakdown_address_breakdown_credit_agencies'
require 'onfido/models/identity_enhanced_breakdown_address_breakdown_credit_agencies_properties'
require 'onfido/models/identity_enhanced_breakdown_address_breakdown_telephone_database'
require 'onfido/models/identity_enhanced_breakdown_address_breakdown_voting_register'
require 'onfido/models/identity_enhanced_breakdown_date_of_birth'
require 'onfido/models/identity_enhanced_breakdown_date_of_birth_breakdown'
require 'onfido/models/identity_enhanced_breakdown_date_of_birth_breakdown_credit_agencies'
require 'onfido/models/identity_enhanced_breakdown_date_of_birth_breakdown_voting_register'
require 'onfido/models/identity_enhanced_breakdown_mortality'
require 'onfido/models/identity_enhanced_breakdown_sources'
require 'onfido/models/identity_enhanced_breakdown_sources_breakdown'
require 'onfido/models/identity_enhanced_breakdown_sources_breakdown_total_sources'
require 'onfido/models/identity_enhanced_breakdown_sources_breakdown_total_sources_properties'
require 'onfido/models/identity_enhanced_properties'
require 'onfido/models/identity_enhanced_properties_matched_addresses_inner'
require 'onfido/models/identity_enhanced_report'
require 'onfido/models/india_pan_report'
require 'onfido/models/india_pan_report_all_of_breakdown'
require 'onfido/models/india_pan_report_all_of_breakdown_device'
require 'onfido/models/india_pan_report_all_of_breakdown_device_breakdown'
require 'onfido/models/india_pan_report_all_of_breakdown_device_breakdown_pan_valid'
require 'onfido/models/india_pan_report_all_of_properties'
require 'onfido/models/india_pan_report_all_of_properties_device'
require 'onfido/models/known_faces_breakdown'
require 'onfido/models/known_faces_breakdown_image_integrity'
require 'onfido/models/known_faces_breakdown_previously_seen_faces'
require 'onfido/models/known_faces_properties'
require 'onfido/models/known_faces_properties_matches_inner'
require 'onfido/models/known_faces_report'
require 'onfido/models/live_photo'
require 'onfido/models/live_photo_response'
require 'onfido/models/live_photos_list'
require 'onfido/models/live_video'
require 'onfido/models/live_videos_list'
require 'onfido/models/location'
require 'onfido/models/location_builder'
require 'onfido/models/location_shared'
require 'onfido/models/motion_capture'
require 'onfido/models/motion_captures_list'
require 'onfido/models/photo_auto_reasons'
require 'onfido/models/photo_reasons'
require 'onfido/models/proof_of_address_breakdown'
require 'onfido/models/proof_of_address_breakdown_data_comparison'
require 'onfido/models/proof_of_address_breakdown_data_comparison_breakdown'
require 'onfido/models/proof_of_address_breakdown_document_classification'
require 'onfido/models/proof_of_address_breakdown_document_classification_breakdown'
require 'onfido/models/proof_of_address_breakdown_image_integrity'
require 'onfido/models/proof_of_address_breakdown_image_integrity_breakdown'
require 'onfido/models/proof_of_address_properties'
require 'onfido/models/proof_of_address_report'
require 'onfido/models/repeat_attempts_list'
require 'onfido/models/repeat_attempts_list_repeat_attempts_inner'
require 'onfido/models/report'
require 'onfido/models/report_document'
require 'onfido/models/report_name'
require 'onfido/models/report_result'
require 'onfido/models/report_shared'
require 'onfido/models/report_status'
require 'onfido/models/report_sub_result'
require 'onfido/models/reports_list'
require 'onfido/models/results_feedback'
require 'onfido/models/sdk_token'
require 'onfido/models/sdk_token_builder'
require 'onfido/models/sdk_token_request'
require 'onfido/models/sdk_token_response'
require 'onfido/models/task'
require 'onfido/models/task_item'
require 'onfido/models/timeline_file_reference'
require 'onfido/models/us_driving_licence_breakdown'
require 'onfido/models/us_driving_licence_breakdown_address'
require 'onfido/models/us_driving_licence_breakdown_address_breakdown'
require 'onfido/models/us_driving_licence_breakdown_document'
require 'onfido/models/us_driving_licence_breakdown_document_breakdown'
require 'onfido/models/us_driving_licence_breakdown_personal'
require 'onfido/models/us_driving_licence_breakdown_personal_breakdown'
require 'onfido/models/us_driving_licence_builder'
require 'onfido/models/us_driving_licence_report'
require 'onfido/models/us_driving_licence_shared'
require 'onfido/models/video_reasons'
require 'onfido/models/watchlist_aml_breakdown'
require 'onfido/models/watchlist_aml_breakdown_adverse_media'
require 'onfido/models/watchlist_aml_breakdown_legal_and_regulatory_warnings'
require 'onfido/models/watchlist_aml_breakdown_politically_exposed_person'
require 'onfido/models/watchlist_aml_breakdown_sanction'
require 'onfido/models/watchlist_aml_properties'
require 'onfido/models/watchlist_aml_report'
require 'onfido/models/watchlist_enhanced_breakdown'
require 'onfido/models/watchlist_enhanced_properties'
require 'onfido/models/watchlist_enhanced_properties_records_inner'
require 'onfido/models/watchlist_enhanced_properties_records_inner_address_inner'
require 'onfido/models/watchlist_enhanced_properties_records_inner_alias_inner'
require 'onfido/models/watchlist_enhanced_properties_records_inner_associate_inner'
require 'onfido/models/watchlist_enhanced_properties_records_inner_attribute_inner'
require 'onfido/models/watchlist_enhanced_properties_records_inner_event_inner'
require 'onfido/models/watchlist_enhanced_properties_records_inner_event_inner_source'
require 'onfido/models/watchlist_enhanced_properties_records_inner_source_inner'
require 'onfido/models/watchlist_enhanced_report'
require 'onfido/models/watchlist_monitor'
require 'onfido/models/watchlist_monitor_builder'
require 'onfido/models/watchlist_monitor_match'
require 'onfido/models/watchlist_monitor_matches_list'
require 'onfido/models/watchlist_monitor_matches_updater'
require 'onfido/models/watchlist_monitor_response'
require 'onfido/models/watchlist_monitor_shared'
require 'onfido/models/watchlist_monitors_list'
require 'onfido/models/watchlist_peps_only_report'
require 'onfido/models/watchlist_sanctions_only_report'
require 'onfido/models/watchlist_standard_breakdown'
require 'onfido/models/watchlist_standard_properties'
require 'onfido/models/watchlist_standard_report'
require 'onfido/models/webhook'
require 'onfido/models/webhook_builder'
require 'onfido/models/webhook_create'
require 'onfido/models/webhook_event'
require 'onfido/models/webhook_event_payload'
require 'onfido/models/webhook_event_payload_object'
require 'onfido/models/webhook_event_type'
require 'onfido/models/webhook_resend'
require 'onfido/models/webhook_response'
require 'onfido/models/webhook_shared'
require 'onfido/models/webhook_update'
require 'onfido/models/webhook_updater'
require 'onfido/models/webhooks_list'
require 'onfido/models/webhooks_resend_item'
require 'onfido/models/workflow_run'
require 'onfido/models/workflow_run_builder'
require 'onfido/models/workflow_run_request'
require 'onfido/models/workflow_run_response'
require 'onfido/models/workflow_run_response_error'
require 'onfido/models/workflow_run_shared'
require 'onfido/models/workflow_run_shared_link'

# APIs
require 'onfido/api/default_api'

module Onfido
  class << self
    # Customize default settings for the SDK using block.
    #   Onfido.configure do |config|
    #     config.username = "xxx"
    #     config.password = "xxx"
    #   end
    # If no block given, return the default Configuration object.
    def configure
      if block_given?
        yield(Configuration.default)
      else
        Configuration.default
      end
    end
  end
end
