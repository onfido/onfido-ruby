# frozen_string_literal: true

require_relative '../shared_contexts/with_document'
require_relative '../shared_examples/file_examples'

describe Onfido::Document do
  describe 'Documents' do
    include_context 'with document'

    it 'uploads a document' do
      expect(document).not_to be_nil
      expect(document.id).not_to be_empty
      expect(document.file_name).to eq('sample_driving_licence.png')
      expect(document).to be_an_instance_of(Onfido::Document)
    end

    it 'lists documents' do
      list_of_documents = onfido_api.list_documents(applicant_id)

      expect(list_of_documents).to be_an_instance_of(Onfido::DocumentsList)
      expect(list_of_documents.documents.size).to be > 0
    end

    it 'finds a document' do
      get_document = onfido_api.find_document(document_id)

      expect(get_document).to be_an_instance_of(Onfido::Document)
      expect(get_document.id).to eq document_id
    end

    describe 'downloading a document' do
      let(:file) { onfido_api.download_document(document_id) }

      it_behaves_like "a valid PNG file", 361771
    end

    it 'cannot download an inexistent document' do
      expect {
        onfido_api.download_document(inexistent_document_id)
      }.to raise_error(Onfido::ApiError) { |e|
        expect(e.code).to eq(404)
      }
    end

    describe 'downloading an NFC face' do
      let(:file) { onfido_api.download_nfc_face(nfc_face_id) }

      it_behaves_like "a valid PNG file", 471345
    end

    it 'cannot download an inexistent NFC face' do
      expect {
        onfido_api.download_nfc_face(inexistent_document_id)
      }.to raise_error(Onfido::ApiError) { |e|
        expect(e.code).to eq(404)
      }
    end
  end
end
