describe Onfido::Extraction do
  subject(:extraction) { described_class.new }
  let(:document_id) { '7568415-123123-123123' }

  describe '#create' do
    it 'creates a new extraction for a document' do
      response = extraction.create(document_id)
      expect(response.keys).to eq(%w[document_id document_classification extracted_data])
      expect(response['document_id']).to eq(document_id)
    end
  end
end
