# frozen_string_literal: true

require_relative '../shared_contexts/with_document'
require_relative '../shared_contexts/with_live_photo'

describe Onfido::Report do
  describe 'Report schemas' do
    include_context 'with document'
    include_context 'with live photo'

    it 'schema of Document report is valid' do
      document_report_id = onfido_api.create_check(
        Onfido::CheckBuilder.new(
          applicant_id: applicant_id,
          document_ids: [document_id],
          report_names: [Onfido::ReportName::DOCUMENT],
      )).report_ids[0]

      document_report = repeat_request_until_status_changes(
        Onfido::ReportStatus::COMPLETE
      ) { onfido_api.find_report(document_report_id) }

      expect(document_report).to be_an_instance_of Onfido::DocumentReport

      expect(document_report.name).to eq("document")
      expect(document_report.breakdown.data_comparison.breakdown.issuing_country.result).to eq("clear")
      expect(document_report.properties.date_of_birth).to eq(Date.parse("1990-01-01"))
    end

    it 'schema of Facial Similarity report is valid' do
      facial_similarity_report_id = onfido_api.create_check(
        Onfido::CheckBuilder.new(
          applicant_id: applicant_id,
          document_ids: [document_id],
          report_names: [Onfido::ReportName::FACIAL_SIMILARITY_PHOTO],
      )).report_ids[0]

      facial_similarity_report = repeat_request_until_status_changes(
        Onfido::ReportStatus::COMPLETE
      ) { onfido_api.find_report(facial_similarity_report_id) }

      expect(facial_similarity_report).to be_an_instance_of Onfido::FacialSimilarityPhotoReport
    end

    it 'schema of Document With Address Information report is valid' do
      report_id = onfido_api.create_check(
        Onfido::CheckBuilder.new(
          applicant_id: applicant_id,
          document_ids: [document_id],
          report_names: [Onfido::ReportName::DOCUMENT_WITH_ADDRESS_INFORMATION],
      )).report_ids[0]

      report = repeat_request_until_status_changes(
        Onfido::ReportStatus::COMPLETE
      ) { onfido_api.find_report(report_id) }

      expect(report).to be_an_instance_of Onfido::DocumentWithAddressInformationReport
      expect(report.properties.barcode[0]).to be_an_instance_of Onfido::DocumentPropertiesBarcodeInner
      expect(report.properties.barcode[0].document_type).to eq("driving_licence")
    end
  end
end
