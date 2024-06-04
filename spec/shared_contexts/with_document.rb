# frozen_string_literal: true

require_relative '../shared_contexts/with_applicant'

RSpec.shared_context 'with document', shared_context: :metadata do
  include_context 'with applicant'

  let(:document_file_name) { 'sample_driving_licence.png' }
  let(:document_file) { File.open("spec/integrations/media/#{document_file_name}") }

  let(:document) { onfido_api.upload_document('passport', applicant_id, document_file) }
  let!(:document_id) { document.id }
end
