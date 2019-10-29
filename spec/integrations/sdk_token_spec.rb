describe Onfido::SdkToken do
  subject(:sdk_token) { described_class.new }

  describe '#create' do
    it 'creates a new SDK token for the applicant' do
      applicant_id = '61f659cb-c90b-4067-808a-6136b5c01351'
      referrer = 'http://*.mywebsite.com/*'

      response = sdk_token.create(applicant_id: applicant_id, referrer: referrer)

      expect(response['token']).not_to be_nil
    end
  end
end
