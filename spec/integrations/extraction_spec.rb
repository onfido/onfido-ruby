# frozen_string_literal: true

require_relative '../shared_contexts/with_document'

describe Onfido::Extraction do
  describe 'Extraction' do
    include_context 'with document'

    it 'performs extraction on a document' do
      extraction = onfido_api.extract(
        Onfido::ExtractRequest.new({
          'document_id': document_id
        })
      )

      expect(extraction).not_to be_nil
      expect(extraction).to be_an_instance_of Onfido::Extraction
      expect(extraction.document_id).to eq document_id

      document_classification = extraction.document_classification
      extracted_data = extraction.extracted_data

      # Check response body: document classification
      expect(document_classification).not_to be_nil
      expect(document_classification.document_type).to eq Onfido::DocumentTypes::DRIVING_LICENCE
      expect(document_classification.issuing_country).to eq Onfido::CountryCodes::GBR

      # Check response body: extracted data
      expect(extracted_data).not_to be_nil
      expect(extracted_data.date_of_birth).to eq Date.parse('1976-03-11')
      expect(extracted_data.date_of_expiry).to eq Date.parse('2031-05-28')
      expect(extracted_data.document_number).to eq '200407512345'
      expect(extracted_data.first_name).to eq 'SARAH'
      expect(extracted_data.last_name).to eq 'MORGAN'
      expect(extracted_data.gender).to eq 'Female'
    end
  end
end
