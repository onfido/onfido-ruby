# frozen_string_literal: true

require_relative '../shared_contexts/with_onfido'

describe Onfido::Address do
  describe 'Address picker' do
    include_context 'with onfido'

    it 'finds an address based on post code' do
      post_code = 'S2 2DF'
      addresses_with_post_code = onfido_api.find_addresses(post_code).addresses

      expect(addresses_with_post_code[0].postcode).to eq post_code
    end
  end
end
