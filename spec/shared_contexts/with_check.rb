# frozen_string_literal: true

require_relative '../shared_contexts/with_document'

RSpec.shared_context 'with check', shared_context: :metadata do
  include_context 'with document'

  let(:check_builder) do
    Onfido::CheckBuilder.new({
      applicant_id: applicant_id,
      document_ids: [document_id],
      report_names: [Onfido::ReportName::DOCUMENT, Onfido::ReportName::IDENTITY_ENHANCED],
    })
  end

  let(:check) { onfido_api.create_check(check_builder) }
  let!(:check_id) { check.id }
end
