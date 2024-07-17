# frozen_string_literal: true

require_relative '../shared_contexts/with_onfido'

RSpec.shared_context 'with applicant', shared_context: :metadata do
  include_context 'with onfido'

  let(:applicant_id) do
    applicant = onfido_api.create_applicant(default_applicant_body)

    applicant.id
  end

  let(:default_applicant_body) do
    {
      'first_name' => 'Test',
      'last_name' => 'Applicant',
      'email' => "first.last@gmail.com",
      'phone_number' => "351911111111",
      'location' => {
        'ip_address' => '127.0.0.1',
        'country_of_residence' => 'GBR'
      }
    }
  end
end
