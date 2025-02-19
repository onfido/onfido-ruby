# frozen_string_literal: true

require_relative '../shared_contexts/with_applicant'

RSpec.shared_context 'with document', shared_context: :metadata do
  include_context 'with applicant'

  let(:document_file_name) { 'sample_driving_licence.png' }
  let(:document_file) { File.open("spec/integrations/media/#{document_file_name}") }

  let(:document) { onfido_api.upload_document(Onfido::DocumentTypes::PASSPORT, applicant_id, document_file) }
  let!(:document_id) { document.id }

  let(:nfc_face_id) { 'cc2dc25f-2df6-4f8f-a5aa-60f49cef9b3c' }

  let(:inexistent_document_id) { '00000000-0000-0000-0000-000000000000' }
end
