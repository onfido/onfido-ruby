# frozen_string_literal: true
require 'onfido'

Onfido.configure do |config|
  config.api_token = ENV["ONFIDO_API_TOKEN"]
  config.debugging = true
  config.region = config.region[:EU]
end

describe Onfido::Applicant do

  let(:applicant_id) { '61f659cb-c90b-4067-808a-6136b5c01351' }
  let(:params) do
    {
      'title' => 'Mr',
      'first_name' => 'Chandler',
      'last_name' => 'Bing',
      'middle_name' => 'Muriel',
      'dob' => '1968-04-08',
      'email' => 'chandler_bing_6@friends.com',
      'address' => {
        'flat_number' => '4',
        'building_number' => '100',
        'building_name' => 'Awesome Building',
        'street' => 'Main Street',
        'sub_street' => 'A sub street',
        'town' => 'London',
        'postcode' => 'SW4 6EH',
        'country' => 'GBR'
      },
      'location' => {
        'ip_address' => '127.0.0.1',
        'country_of_residence' => 'GBR'
      }
    }
  end

  let(:onfido_api) do
    Onfido::DefaultApi.new
  end

  describe '#create' do
    it 'creates an applicant' do
      applicant = onfido_api.create_applicant(params)
      expect(applicant.id).not_to be_nil
      expect(applicant.first_name).to eq 'Chandler'
      expect(applicant.last_name).to eq 'Bing'
      expect(applicant.email).to eq 'chandler_bing_6@friends.com'
      expect(applicant.dob).to eq Date.parse('1968-04-08')
      expect(applicant.address.flat_number).to eq '4'
      expect(applicant.address.building_number).to eq '100'
      expect(applicant.address.building_name).to eq 'Awesome Building'
      expect(applicant.address.street).to eq 'Main Street'
      expect(applicant.address.sub_street).to eq 'A sub street'
      expect(applicant.address.town).to eq 'London'
      expect(applicant.address.postcode).to eq 'SW4 6EH'
      expect(applicant.address.country).to eq 'GBR'
      expect(applicant.location.ip_address).to eq '127.0.0.1'
      expect(applicant.location.country_of_residence).to eq 'GBR'
    end
  end
end