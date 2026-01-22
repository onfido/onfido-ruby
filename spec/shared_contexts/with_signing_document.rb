# frozen_string_literal: true

require_relative '../shared_contexts/with_applicant'

RSpec.shared_context 'with signing document', shared_context: :metadata do
  include_context 'with applicant'

  let(:signing_document_file_name) { 'sample_signing_document.pdf' }
  let(:signing_document_file) { File.open("spec/integrations/media/#{signing_document_file_name}") }

  let(:signing_document) { onfido_api.upload_signing_document(applicant_id, signing_document_file) }
  let!(:signing_document_id) { signing_document.id }

  let(:inexistent_signing_document_id) { '00000000-0000-0000-0000-000000000000' }
end
