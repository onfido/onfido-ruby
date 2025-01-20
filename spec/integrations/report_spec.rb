# frozen_string_literal: true

require_relative '../shared_contexts/with_check'

describe Onfido::Report do
  describe 'Report' do
    include_context 'with check'

    let(:sorted_reports) do
      sort_reports(onfido_api.list_reports(check.id).reports)
    end
    let(:document_report_id) { sorted_reports[0].id }
    let(:identity_report_id) { sorted_reports[1].id }


    def sort_reports(reports_list)
      reports_list.sort_by { |report| report.name }
    end

    it 'lists reports' do
      expect(sorted_reports[0].name).to eq Onfido::ReportName::DOCUMENT
      expect(sorted_reports[1].name).to eq Onfido::ReportName::IDENTITY_ENHANCED
    end

    it 'finds a report' do
      get_document_report = repeat_request_until_status_changes(Onfido::ReportStatus::COMPLETE) {
        onfido_api.find_report(document_report_id)
      }
      get_identity_report = onfido_api.find_report(identity_report_id)

      expect(get_document_report).to be_an_instance_of Onfido::DocumentReport
      expect(get_document_report.id).to eq document_report_id
      expect(get_document_report.name).to eq Onfido::ReportName::DOCUMENT
      expect(get_document_report.status).to eq Onfido::ReportStatus::COMPLETE

      expect(get_identity_report).to be_an_instance_of Onfido::IdentityEnhancedReport
      expect(get_identity_report.id).to eq identity_report_id
      expect(get_identity_report.name).to eq Onfido::ReportName::IDENTITY_ENHANCED
      expect(get_identity_report.status).to eq Onfido::ReportStatus::COMPLETE
      expect(get_identity_report.breakdown.date_of_birth).to be_nil
      expect(get_identity_report.breakdown.address).to be_nil
    end

    it 'resumes a report' do
      onfido_api.resume_report(document_report_id)
    end

    it 'cancels a report' do
      onfido_api.cancel_report(document_report_id)
    end
  end
end
