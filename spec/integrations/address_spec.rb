# frozen_string_literal: true

describe Onfido::Address do
  include_context 'fake onfido api'

  describe '#all' do
    it 'returns the addresses matching the postcode' do
      response = onfido.address.all('SW1 4NG')

      expect(response['addresses'].count).to eq(2)
    end
  end
end
