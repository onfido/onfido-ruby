# frozen_string_literal: true

require_relative '../shared_contexts/with_applicant'

describe Onfido::SdkToken do
  describe 'SDK token' do
    include_context 'with applicant'

    it 'generates a SDK token' do
      token_builder = Onfido::SdkTokenBuilder.new({
        applicant_id: applicant_id,
        referrer: 'https://*.example.com/example_page/*',
      })
      token = onfido_api.generate_sdk_token(token_builder)

      expect(token).to be_an_instance_of Onfido::SdkToken
      expect(token.token.size).to be > 0
    end
  end
end
