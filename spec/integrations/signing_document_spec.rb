# frozen_string_literal: true

require_relative '../shared_contexts/with_signing_document'
require_relative '../shared_examples/file_examples'

describe Onfido::SigningDocument do
  describe 'Signing Documents' do
    include_context 'with signing document'

    it 'uploads a signing document' do
      expect(signing_document).not_to be_nil
      expect(signing_document.id).not_to be_empty
      expect(signing_document.file_name).to eq('sample_signing_document.pdf')
      expect(signing_document.file_type).to eq('pdf')
      expect(signing_document.applicant_id).to eq(applicant_id)
      expect(signing_document.href).not_to be_nil
      expect(signing_document.download_href).not_to be_nil
      expect(signing_document.file_size).to be > 0
      expect(signing_document.to_hash).not_to be_nil
    end

    describe 'downloading a signing document' do
      let(:file) { onfido_api.download_signing_document(signing_document_id) }

      it_behaves_like "a valid PDF file"
    end

    it 'finds a signing document' do
      found_document = onfido_api.find_signing_document(signing_document_id)

      expect(found_document).to be_an_instance_of(Onfido::SigningDocument)
      expect(found_document.id).to eq signing_document_id
      expect(found_document.file_name).to eq('sample_signing_document.pdf')
      expect(found_document.file_type).to eq('pdf')
      expect(found_document.applicant_id).to eq(applicant_id)
      expect(found_document.download_href).not_to be_nil
      expect(found_document.to_hash).not_to be_nil
    end

    it 'lists signing documents' do
      documents = onfido_api.list_signing_documents(applicant_id)

      expect(documents).to be_an_instance_of(Onfido::SigningDocumentsList)
      expect(documents.signing_documents.map(&:id)).to include(signing_document_id)
    end

    it 'cannot upload a signing document without required parameters' do
      expect {
        onfido_api.upload_signing_document(nil, nil)
      }.to raise_error(ArgumentError)
    end

    it 'cannot download an inexistent signing document' do
      expect {
        onfido_api.download_signing_document(inexistent_signing_document_id)
      }.to raise_error(Onfido::ApiError) { |e|
        expect(e.code).to eq(404)
      }
    end
  end
end
