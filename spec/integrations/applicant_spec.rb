# frozen_string_literal: true

require_relative '../shared_contexts/with_applicant'

describe Onfido::Applicant do
  describe 'Applicants' do
    include_context 'with applicant'

    it 'creates an applicant' do
      params = {
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
        },
        'consents' => [{
          'name' => Onfido::ApplicantConsentName::PRIVACY_NOTICES_READ,
          'granted' => true
        }]
      }

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

    it 'lists applicants' do
      list_of_applicants = onfido_api.list_applicants()

      expect(list_of_applicants).to be_an_instance_of Onfido::ApplicantsList
      expect(list_of_applicants.applicants.size).to be > 0
    end

    it 'finds an applicant' do
      applicant = onfido_api.find_applicant(applicant_id)

      expect(applicant).to be_an_instance_of Onfido::Applicant
      expect(applicant.id).to eq applicant_id
      expect(applicant.first_name).to eq 'Test'
      expect(applicant.last_name).to eq 'Applicant'
    end

    it 'updates an applicant' do
      new_applicant_data = Onfido::ApplicantUpdater.new(
        first_name: 'Jane',
        last_name: 'Doe',
        dob: '1968-04-08'
      )
      updated_applicant = onfido_api.update_applicant(applicant_id, new_applicant_data)
      expect(updated_applicant.first_name).to eq 'Jane'
      expect(updated_applicant.last_name).to eq 'Doe'
      expect(updated_applicant.dob).to eq Date.parse('1968-04-08')
    end

    it 'deletes an applicant' do
      onfido_api.delete_applicant(applicant_id)

      expect {
        onfido_api.find_applicant(applicant_id)
      }.to raise_error(Onfido::ApiError) { |e|
        expect(e.code).to eq(410)
      }
    end

    it 'restores an applicant' do
      onfido_api.delete_applicant(applicant_id)
      onfido_api.restore_applicant(applicant_id)
    end
  end
end
