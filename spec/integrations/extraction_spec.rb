# frozen_string_literal: true

require 'tempfile'

describe Onfido::Extraction do
  include_context 'fake onfido api'

  subject(:extraction) { onfido.extraction }

  describe '#create' do
    let(:params) do
      {
        document_id: '7568415-123123-123123'
      }
    end

    it 'creates a new extraction' do
      response = extraction.create(**params)

      expect(response['document_id']).to eq('7568415-123123-123123')
    end
  end
end
