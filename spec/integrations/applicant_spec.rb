# frozen_string_literal: true

describe Onfido::Applicant do
  include_context 'fake onfido api'

  subject(:applicant) { onfido.applicant }

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
      }
    }
  end

  describe '#create' do
    # Need to find a better way of testing that the request is not malformed.
    # Currently this runs for every feature spec. The fact that it's under here
    # is only for semantic reasons

    it 'serializes the payload correctly' do
      WebMock.after_request do |request_signature, _response|
        if request_signature.uri.path == 'v3.2/applicants'
          expect(Rack::Utils.parse_nested_query(request_signature.body))
            .to eq(params)
        end
      end
    end

    it 'creates an applicant' do
      response = applicant.create(params)
      expect(response['id']).not_to be_nil
    end
  end

  describe '#update' do
    it 'updates an applicant' do
      response = applicant.update(applicant_id, params)

      expect(response['id']).to eq(applicant_id)
    end
  end

  describe '#find' do
    it 'returns the applicant' do
      response = applicant.find(applicant_id)

      expect(response['id']).to eq(applicant_id)
    end
  end

  describe '#destroy' do
    it 'returns success code' do
      expect { applicant.destroy(applicant_id) }.not_to raise_error
    end
  end

  describe '#all' do
    context 'with the default page and per page params' do
      it 'returns all the applicants' do
        response = applicant.all

        expect(response['applicants'].size).to eq(2)
      end
    end

    context 'with specific range of results for a page' do
      it 'returns the specified applicants' do
        response = applicant.all(page: 1, per_page: 1)

        expect(response['applicants'].size).to eq(1)
      end
    end
  end

  describe '#restore' do
    context 'an applicant scheduled for deletion' do
      it 'returns nil' do
        expect(applicant.restore(applicant_id)).to be_nil
      end
    end

    context 'an applicant not scheduled for deletion' do
      it 'returns an error' do
        applicant_id = 'a2fb9c62-ab10-4898-a8ec-342c4b552ad5'

        expect { applicant.restore(applicant_id) }.to raise_error do |error|
          expect(error).to be_a(Onfido::RequestError)
          expect(error.message).to eq('There was a validation error on this request')
          expect(error.fields).to eq(
            'Applicant a2fb9c62-ab10-4898-a8ec-342c4b552ad5 is not scheduled for deletion'
          )
        end
      end
    end
  end
end
