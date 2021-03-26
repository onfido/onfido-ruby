# frozen_string_literal: true

require 'tempfile'

describe Onfido::Document do
  subject(:document) { described_class.new }

  describe '#create' do
    let(:params) do
      {
        applicant_id: '1030303-123123-123123',
        type: 'driving_licence',
        file: file,
        side: 'front'
      }
    end

    context 'with a File-like object to upload' do
      let(:file) { Tempfile.new(['driving_licence', '.jpg']) }

      after do
        file.close
        file.unlink
      end

      it 'creates a new document' do
        response = document.create(**params)

        expect(response['id']).not_to be_nil
      end
    end

    context 'passing in a non-File-like file to upload' do
      let(:file) { 'https://onfido.com/images/logo.png' }

      it 'raises an ArgumentError' do
        expect { document.create(**params) }
          .to raise_error(ArgumentError, /must be a `File`-like object/)
      end
    end
  end

  describe '#find' do
    it 'returns the expected document' do
      document_id = '7568415-123123-123123'
      response = document.find(document_id)

      expect(response['id']).to eq(document_id)
    end
  end

  describe '#all' do
    it 'returns list of documents' do
      applicant_id = '1030303-123123-123123'
      response = document.all(applicant_id)

      expect(response['documents']).not_to be_empty
    end
  end

  describe '#download' do
    it 'returns the file data' do
      document_id = '1212121-123123-123123'
      response = document.download(document_id)

      expect(response).not_to be_nil
    end
  end
end
